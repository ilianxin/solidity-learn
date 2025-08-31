// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Overloading {

    function sum(uint a, uint b) public pure returns(uint){
        return a + b;
    }

    function sum(uint a, uint b, uint c) public pure returns(uint){
        return a + b + c;
    }

    constructor(){

    }
}
