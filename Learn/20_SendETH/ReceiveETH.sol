// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract ReceiveETH {

    event Log(string message, uint value);

    receive () external payable {
        emit Log("Receive ReceiveETH", msg.value);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }



    constructor(){

    }
}
