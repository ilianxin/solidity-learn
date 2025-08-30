// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Event {


    event Transfer(address indexed from, address indexed to, uint amount, string message);

    function _transfer(address to, uint amount, string memory message) public {
        emit Transfer(msg.sender, to, amount, message);
    }

    constructor(){

    }
}
