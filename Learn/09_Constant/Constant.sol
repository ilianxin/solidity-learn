// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

contract Constant {

    uint256 public constant MY_UINT = 123;
    string public constant MY_STRING = "Hello, World!";
    bytes public constant MY_BYTES = "abc";
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000000000;

    uint256 public immutable MY_IMMUTABLE_UINT = 99999990;
    address public immutable MY_IMMUTABLE_ADDRESS;
    uint256 public immutable MY_IMMUTABLE_BLOCK;
    uint256 public immutable MY_IMMUTABLE_TIMESTAMP;




    constructor(){
        MY_IMMUTABLE_ADDRESS = msg.sender;
        MY_IMMUTABLE_BLOCK = block.number;
        MY_IMMUTABLE_TIMESTAMP = block.timestamp;
        MY_IMMUTABLE_UINT = 88888888;
    }
}
