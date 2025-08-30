// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Modifier {


    address owner;

    constructor(address _owner) {
        owner = _owner;

    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
