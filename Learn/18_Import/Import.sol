// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;


import {Yeye} from "./Yeye.sol";
import "./Yeye.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract Import {

    using Address for address;

    Yeye yeye = new Yeye();

    function test() external {
        string memory name = yeye.name();

    }


    constructor(){

    }
}
