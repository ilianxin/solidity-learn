# Meme Project

## 简介
深入理解 Meme 代币的核心机制，包括代币税、流动性池和交易限制等概念，
并通过实践操作，独立实现 SHIB 风格代币合约，
提升智能合约开发的实践能力和解决实际问题的能力。

## 目录
- [环境准备](#环境准备)
- [合约部署](#合约部署)
- [功能使用](#功能使用)
- [注意事项](#注意事项)
- [测试建议](#测试建议)

## 环境准备
安装步骤说明。

```bash
# 安装依赖
npm install @openzeppelin/contracts
npm install @uniswap/v2-core
npm install @uniswap/v2-periphery

# 或使用 Hardhat/Truffle 框架
```

## 合约部署

```JavaScript
// 部署参数
const constructorParams = {
name: "MyMemeToken",
symbol: "MMT",
totalSupply: 1000000000, // 10亿代币
routerAddress: "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D", // Uniswap V2 Router
marketingWallet: "0x...", // 营销钱包地址
liquidityWallet: "0x..."  // 流动性钱包地址
};
```
## 功能使用
代币交易：
• 普通转账自动征收 5% 税费
• 排除地址可免手续费

管理员操作：
```JavaScript
// 调整税率
await contract.setTaxFee(3); // 设置为3%

// 更新黑名单
await contract.updateBlacklist(address, true);

// 调整分配比例
await contract.setDistributionShares(50, 25, 25);
```
## 注意事项
• 部署前充分测试所有功能
• 确保管理员地址安全
• 设置合理的交易限制参数
• 定期检查合约状态

## 测试建议
1.本地测试：使用 Hardhat 本地网络测试所有功能
2.测试网部署：先在 Sepolia 测试网验证
3.前端集成：开发简单 DApp 界面进行完整测试

