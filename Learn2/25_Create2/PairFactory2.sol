// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Pair} from "./Pair.sol";

contract PairFactory2 {

    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    function createPair2(address tokenA, address tokenB) external returns(address pairAddr){
        require(tokenA != tokenB, "Identical addresses");
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), "Zero address");
        require(getPair[token0][token1] == address(0), "Pair exists");

        bytes32 salt = keccak256(abi.encodePacked(token0, token1));

        Pair pair = new Pair{salt: salt}();

        pair.initialize(token0, token1);

        pairAddr = address(pair);

        getPair[token0][token1] = pairAddr;
        getPair[token1][token0] = pairAddr; // populate reverse mapping
        allPairs.push(pairAddr);
    }

    function calculateAddress(address tokenA, address tokenB) external view returns(address pairAddr){
        require(tokenA != tokenB, "Identical addresses");
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), "Zero address");
        require(getPair[token0][token1] == address(0), "Pair exists");

        bytes memory bytecode = type(Pair).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                salt,
                keccak256(bytecode)
            )
        );
        pairAddr = address(uint160(uint256(hash)));
    }

    constructor(){

    }
}
