// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract InsertionSort {

    function ifElse(uint a, uint b) public pure returns(string memory){
        if(a > b){
            return "a > b";
        }else if(a < b){
            return "a < b";
        }else{
            return "a == b";
        }
    }

    function whileLoop(uint n) public pure returns(uint){
        uint sum = 0;
        uint i = 1;
        while(i <= n){
            sum += i;
            i++;
        }
        return sum;
    }

    function forLoop(uint n) public pure returns(uint){
        uint sum = 0;
        for(uint i = 1; i <= n; i++){
            sum += i;
        }
        return sum;
    }

    function doWhileLoop(uint n) public pure returns(uint){
        uint sum = 0;
        uint i = 1;
        do{
            sum += i;
            i++;
        }while(i <= n);
        return sum;
    }

    function ternary(uint a, uint b) public pure returns(uint){
        return a > b ? a : b;
    }

    function insertSort(uint[] memory arr) public pure returns(uint[] memory){
        uint len = arr.length;
        for(uint i = 1; i < len; i++){
            uint key = arr[i];
            uint j = i - 1;
            while(j >= 0 && arr[j] > key){
                arr[j + 1] = arr[j];
                if(j == 0){
                    break;
                }
                j--;
            }
            if(j == 0 && arr[0] > key){
                arr[0] = key;
            }else{
                arr[j + 1] = key;
            }
        }
        return arr;
    }

    constructor(){

    }
}
