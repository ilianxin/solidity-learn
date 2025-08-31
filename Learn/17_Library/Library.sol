// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/utils/Strings.sol";


contract Library {

    using Strings for uint256;

    function uintToString(uint256 value) public pure returns (string memory) {
        return value.toHexString();
    }

    function uintToStringDecimal(uint256 value) public pure returns (string memory) {
        return Strings.toString(value);
    }


}
