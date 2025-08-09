// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeSortedArray{

    function mergeSortedArray(uint [] memory a1, uint[]  memory a2) public pure returns (uint [] memory) {
        uint[] memory mergedArray = new uint[](a1.length + a2.length);
        uint i = 0; 
        uint j = 0; 
        uint k = 0;

        while(i < a1.length && j < a2.length) {
            if(a1[i] < a2[j]) {
                mergedArray[k] = a1[i];
                i++;
            } else {
                mergedArray[k] = a2[j];
                j++;
            }
            k++;

            if ( i == a1.length) {
                for (uint x = j; x < a2.length; x++) {
                    mergedArray[k]  = a2[x];
                    k++;
                }
            }


            
            if ( j == a2.length) {
                for (uint x = i; x < a1.length; x++) {
                    mergedArray[k]  = a1[x];
                    k++;
                }
            }


        }

        return mergedArray;
    }
}


