// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Fallback {

    event ReceiveLog(address sender, uint amount);

    function receiveEther() public payable {
        emit ReceiveLog(msg.sender, msg.value);
    }

    event FallbackLog(address sender, uint amount, bytes data);

    fallback() external payable {
        emit FallbackLog(msg.sender, msg.value, msg.data);
    }


    constructor(){

    }
}
