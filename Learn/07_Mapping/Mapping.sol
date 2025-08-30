// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Mapping {

    mapping(uint => address) public id2Address;
    mapping(address => address) public address2Address;


    function writeMapping(uint id, address addr) public {
        id2Address[id] = addr;
        address2Address[msg.sender] = addr;
    }

    constructor(){

    }
}
