// SPDX-License-Ientifier: MIT
pragma solidity ^0.8.0;

contract Reverse {

    function reverse(string memory code) public pure returns (string memory) {

        bytes memory codeChars = bytes(code);

        uint length = codeChars.length;

        bytes memory reversed = new bytes(length);

        for (uint i = 0 ; i < length ; i ++) {
            reversed[i] = codeChars[length - i - 1];
        }

        return string(reversed);
    }
     
}