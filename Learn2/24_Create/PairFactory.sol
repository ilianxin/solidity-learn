// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;
import {Pair} from "./Contract.sol";

contract PairFactory {


    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    function createPair(address tokenA, address tokenB) external returns(address pairAddr){

        Pair pair = new Pair();
        pair.initialize(tokenA, tokenB);
        pairAddr = address(pair);

        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr; // populate reverse mapping


    }

    constructor(){

    }
}
