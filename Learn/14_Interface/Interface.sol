// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

abstract contract Interface {

    string public name = "Interface";

    function getName() public view virtual returns (string memory) ;

    constructor(){

    }
}

contract Implementer is Interface {

    function getName() public view virtual override returns (string memory) {
        return name;
    }

    constructor(){

    }
}