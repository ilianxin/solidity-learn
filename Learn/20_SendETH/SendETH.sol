// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract SendETH {

    event Log(string message, uint value);

    receive () external payable {
        emit Log("Receive SendETH", msg.value);
    }

    function transferETH(address payable _to, uint amount) public payable {
        // _to.transfer(1 ether); // 2300 gas, revert if failed
        // bool sent = _to.send(1 ether); // 2300 gas, return false if failed
        _to.transfer(amount);
    }

    error SendFailed();

    function sendETH(address payable _to, uint amount) public payable {
        // (bool success, ) = _to.call{value: 1 ether}(""); // forward all gas or set gas like gas: 100000
        bool success = _to.send(amount); // 2300 gas, return false if failed

        if (!success) {
            revert SendFailed();
        }
    }

    error CallFailed();

    function callETH(address payable _to, uint amount) public payable {
        (bool success, ) = _to.call{value: amount}(""); // forward all gas or set gas like gas: 100000

        if (!success) {
            revert CallFailed();
        }
    }




    constructor() payable{

    }
}
