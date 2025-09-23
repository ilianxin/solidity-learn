// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

contract MemeToken is ERC20, Ownable {
    // 代币税配置
    uint256 public taxFee = 5; // 5% 交易税
    uint256 public constant MAX_TAX = 10; // 最大税率限制

    // 税费分配比例
    uint256 public liquidityShare = 40; // 40% 给流动性
    uint256 public marketingShare = 30; // 30% 给营销
    uint256 public rewardShare = 30; // 30% 给持币者

    // 交易限制
    uint256 public maxTxAmount; // 最大交易金额
    uint256 public maxWalletAmount; // 最大持币量
    uint256 public tradeCooldown = 30 minutes; // 交易冷却时间

    // 地址映射
    address public marketingWallet;
    address public liquidityWallet;
    mapping(address => bool) public isExcludedFromFee;
    mapping(address => bool) public isExcludedFromMaxTx;
    mapping(address => uint256) public lastTradeTime;
    mapping(address => bool) public blacklisted;

    // Uniswap 相关
    IUniswapV2Router02 public uniswapV2Router;
    address public uniswapV2Pair;
    bool inSwapAndLiquify;

    // 事件
    event TaxDistributed(uint256 liquidityAmount, uint256 marketingAmount, uint256 rewardAmount);
    event BlacklistUpdated(address indexed account, bool isBlacklisted);
    event TaxSettingsUpdated(uint256 newTaxFee, uint256 liquidityShare, uint256 marketingShare, uint256 rewardShare);

    modifier lockTheSwap() {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply,
        address routerAddress,
        address _marketingWallet,
        address _liquidityWallet
    ) ERC20(name, symbol) {
        _mint(msg.sender, totalSupply * 10**decimals());

        // 初始化 Uniswap
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(routerAddress);
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        uniswapV2Router = _uniswapV2Router;

        marketingWallet = _marketingWallet;
        liquidityWallet = _liquidityWallet;

        // 设置交易限制（初始为总供应量的 1%）
        maxTxAmount = totalSupply * 10**decimals() / 100;
        maxWalletAmount = totalSupply * 10**decimals() / 50;

        // 排除合约和特定地址手续费
        isExcludedFromFee[owner()] = true;
        isExcludedFromFee[address(this)] = true;
        isExcludedFromFee[marketingWallet] = true;
        isExcludedFromFee[liquidityWallet] = true;

        // 排除最大交易限制
        isExcludedFromMaxTx[owner()] = true;
        isExcludedFromMaxTx[address(this)] = true;
    }

    // 代币转移重写（含税逻辑）
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(!blacklisted[from] && !blacklisted[to], "Blacklisted address");

        // 交易限制检查
        if (!isExcludedFromMaxTx[from]) {
            require(amount <= maxTxAmount, "Exceeds max transaction amount");
            require(balanceOf(to) + amount <= maxWalletAmount, "Exceeds max wallet amount");

            // 交易冷却时间检查
            if (from == uniswapV2Pair) { // 购买
                require(block.timestamp >= lastTradeTime[to] + tradeCooldown, "Trade cooldown");
                lastTradeTime[to] = block.timestamp;
            } else if (to == uniswapV2Pair) { // 出售
                require(block.timestamp >= lastTradeTime[from] + tradeCooldown, "Trade cooldown");
                lastTradeTime[from] = block.timestamp;
            }
        }

        // 税费计算和处理
        uint256 taxAmount = 0;
        if (!isExcludedFromFee[from] && !isExcludedFromFee[to] && !inSwapAndLiquify) {
            taxAmount = amount * taxFee / 100;

            if (taxAmount > 0) {
                super._transfer(from, address(this), taxAmount);
                _distributeTax(taxAmount);
            }
        }

        // 实际转账金额
        uint256 transferAmount = amount - taxAmount;
        super._transfer(from, to, transferAmount);
    }

    // 税费分配
    function _distributeTax(uint256 taxAmount) private lockTheSwap {
        uint256 liquidityAmount = taxAmount * liquidityShare / 100;
        uint256 marketingAmount = taxAmount * marketingShare / 100;
        uint256 rewardAmount = taxAmount * rewardShare / 100;

        // 添加到流动性
        if (liquidityAmount > 0) {
            _addLiquidity(liquidityAmount);
        }

        // 转账营销费用
        if (marketingAmount > 0) {
            super._transfer(address(this), marketingWallet, marketingAmount);
        }

        // 持币奖励（简化版）
        if (rewardAmount > 0) {
            _distributeRewards(rewardAmount);
        }

        emit TaxDistributed(liquidityAmount, marketingAmount, rewardAmount);
    }

    // 添加流动性
    function _addLiquidity(uint256 tokenAmount) private {
        uint256 half = tokenAmount / 2;
        uint256 otherHalf = tokenAmount - half;

        // 兑换代币为 ETH
        uint256 initialBalance = address(this).balance;
        _swapTokensForEth(half);
        uint256 newBalance = address(this).balance - initialBalance;

        // 添加流动性
        _addLiquidity(otherHalf, newBalance);
    }

    function _swapTokensForEth(uint256 tokenAmount) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    function _addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0,
            0,
            liquidityWallet,
            block.timestamp
        );
    }

    // 持币奖励分配（简化版）
    function _distributeRewards(uint256 rewardAmount) private {
        // 实际项目中应按持币比例分配
        // 这里简化为转入奖励池
        super._transfer(address(this), liquidityWallet, rewardAmount);
    }

    // 管理员功能
    function setTaxFee(uint256 _taxFee) external onlyOwner {
        require(_taxFee <= MAX_TAX, "Tax too high");
        taxFee = _taxFee;
        emit TaxSettingsUpdated(_taxFee, liquidityShare, marketingShare, rewardShare);
    }

    function setDistributionShares(
        uint256 _liquidityShare,
        uint256 _marketingShare,
        uint256 _rewardShare
    ) external onlyOwner {
        require(_liquidityShare + _marketingShare + _rewardShare == 100, "Shares must sum to 100");
        liquidityShare = _liquidityShare;
        marketingShare = _marketingShare;
        rewardShare = _rewardShare;
        emit TaxSettingsUpdated(taxFee, liquidityShare, marketingShare, rewardShare);
    }

    function setMaxTxAmount(uint256 _maxTxAmount) external onlyOwner {
        maxTxAmount = _maxTxAmount;
    }

    function setMaxWalletAmount(uint256 _maxWalletAmount) external onlyOwner {
        maxWalletAmount = _maxWalletAmount;
    }

    function setTradeCooldown(uint256 _cooldown) external onlyOwner {
        tradeCooldown = _cooldown;
    }

    function updateBlacklist(address account, bool isBlacklist) external onlyOwner {
        blacklisted[account] = isBlacklist;
        emit BlacklistUpdated(account, isBlacklist);
    }

    function excludeFromFee(address account, bool excluded) external onlyOwner {
        isExcludedFromFee[account] = excluded;
    }

    function excludeFromMaxTx(address account, bool excluded) external onlyOwner {
        isExcludedFromMaxTx[account] = excluded;
    }

    // 接收ETH
    receive() external payable {}
}