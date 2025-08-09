// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInt {

    mapping(bytes1 => int256) values ;

    constructor () {
        values['I'] = 1;
        values['V'] = 5;
        values['X'] = 10;
        values['L'] = 50;
        values['C'] = 100;
        values['D'] = 500;
        values['M'] = 1000;
    }

    function romanToInt(string memory s) public view returns (int256) {
        int256 result ;

        bytes memory chars = bytes(s);

        for ( uint i=0 ; i < chars.length ; i ++   ) {

               int256 number = values[chars[i]];

                if (i < chars.length - 1) {
                    int256 nextNum = values[chars[i+1]];

                    if (number < nextNum ){

                        result -= number;
                        continue;
                    }
                } 
               result += number;
        }

        return result;
    }
}