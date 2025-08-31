// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract OtherContract {

    uint256 private _x = 0;

    event Log(uint amout, uint256 gas);

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function setX(uint256 x) external payable {
        _x = x;

        if (msg.value > 0) {
            // do something with the received ether
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns (uint256) {
        return _x;
    }

    constructor(){

    }
}
