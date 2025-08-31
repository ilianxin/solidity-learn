// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract C {
    uint public num;

    address public  sender;

    function setVars(uint _num) public payable{
        num = _num;
        sender = msg.sender;
    }

    constructor(){

    }
}
