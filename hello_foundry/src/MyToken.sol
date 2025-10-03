// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC20} from "solmate/tokens/ERC20.sol";

contract MyToken is ERC20 {
    constructor(
        
    ) ERC20(name, symbol, decimals) {
        _mint(msg.sender, 0);
    }
}

