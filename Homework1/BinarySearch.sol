// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {

    function binarySearch (int256 [] memory nums, int256 target) public pure returns (int) {

        uint low = 0;
        uint high = nums.length; 
        int index = -1;

        while (low < high ) {
            uint middle =  (high - low ) / 2 + low ;

            if ( nums[middle] == target ) { 
                index = int(middle);
                break;
            }
            
            if (nums[middle] < target) {
                low = middle + 1;
            } else {
                high = middle;
            }
        }

        return index;
    }

}