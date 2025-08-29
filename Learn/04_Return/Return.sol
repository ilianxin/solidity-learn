// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Return {

    function returnMany() public pure returns(uint, bool, uint256[3] memory){
        return (1, true, [(uint256(1)), 2, 3]);
    }

    function returnNamed() public pure returns(uint x, bool b, uint256[3] memory arr){
        x = 1;
        b = true;
        arr = [uint256(1), 2, 3];
    }

    function readReturns() public pure {
        (uint x, bool b, uint256[3] memory arr) = returnMany();
        (, , uint256[3] memory arr2) = returnMany();
        (uint i, , ) = returnMany();

        (uint x2, bool b2, uint256[3] memory arr3) = returnNamed();
    }

    constructor(){

    }
}
