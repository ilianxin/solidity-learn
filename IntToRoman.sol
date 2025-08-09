// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntToRoman {

    struct RomanNumeral {
        uint value;
        string symbol;
    }

    RomanNumeral[] private romanNumerals;

    constructor () {
        romanNumerals.push(RomanNumeral(1000, "M"));
        romanNumerals.push(RomanNumeral(900, "CM"));
        romanNumerals.push(RomanNumeral(500, "D"));
        romanNumerals.push(RomanNumeral(400, "CD"));
        romanNumerals.push(RomanNumeral(100, "C"));
        romanNumerals.push(RomanNumeral(90, "XC"));
        romanNumerals.push(RomanNumeral(50, "L"));
        romanNumerals.push(RomanNumeral(40, "XL"));
        romanNumerals.push(RomanNumeral(10, "X"));
        romanNumerals.push(RomanNumeral(9, "IX"));
        romanNumerals.push(RomanNumeral(5, "V"));
        romanNumerals.push(RomanNumeral(4, "IV"));
        romanNumerals.push(RomanNumeral(1, "I"));
    }

    function intToRoman (uint number) public view returns (string memory) {

        require( number >0 && number <3999, "Number must between 0 and 3999" );

        string memory result;

        uint left = number;

        for (uint i =0; i < romanNumerals.length; i ++) {
            uint value = romanNumerals[i].value;
            string memory symbol = romanNumerals[i].symbol;
            while (left >= value) {
                result = string(abi.encodePacked(result, symbol));
                left -= value;
            }
        }
        
        return  result;

    }

}