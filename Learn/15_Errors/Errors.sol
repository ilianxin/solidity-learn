// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Errors {

    error TransferNotOwner(address _from);

    function testRequire(address _from) public view {
        require(msg.sender == _from, "Not owner");
    }

    function testRevert(address _from) public view {
        if(msg.sender != _from){
            revert TransferNotOwner(_from);
        }
    }

    function testAssert(address _from) public view {
        assert(msg.sender == _from);
    }

    constructor(){

    }
}
