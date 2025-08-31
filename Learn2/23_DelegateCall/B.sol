// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract B {

    uint public num;
    address public sender;

    function callSetVars(address _contract, uint _num) public payable{
        (bool success, ) = _contract.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "call failed");
    }

    function delegateCallSetVars(address _contract, uint _num) public payable{
        (bool success, ) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "delegatecall failed");
    }

    constructor(){

    }
}
