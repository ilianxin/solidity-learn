// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Pair {

    address public factory;
    address public token0;
    address public token1;

    constructor() payable{
        factory = msg.sender;
    }

    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, "Not factory");
        token0 = _token0;
        token1 = _token1;
    }
}
