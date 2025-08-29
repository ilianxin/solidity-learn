// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract ValueTypes {

    bool public myBool = true; // Boolean
    bool public myBool1 = !myBool; // Boolean
    bool public myBool2 = myBool || myBool1; // Boolean
    bool public myBool3 = myBool && myBool1; // Boolean
    bool public myBool4 = myBool == myBool1; // Boolean
    bool public myBool5 = myBool != myBool1; // Boolean

    int public myInt = -1; // Integer
    uint public myUint = 1; // Unsigned Integer
    uint256 public myUint256 = 256; // Unsigned Integer 256 bits

    uint256 public myUint1 = myUint256 + 1;
    uint256 public myUint2 = 2**2; // Exponentiation
    uint256 public myUint3 = 7 % 2; // Modulus
    bool public myBool6 = myUint1 > myUint2; // Greater than

    address public myAddress = 0x2321421423123213213213213213213213213213; // Address
    address payable public myPayableAddress = payable(myAddress);  // Payable Address
    uint256 public balance = myPayableAddress.balance; // Balance of the address

    bytes32 public myBytes32 = "Hello, World!"; // Bytes32
    bytes1 public myBytes1 = myBytes32[0]; // First byte of bytes32

    enum Color { Red, Green, Blue } // Enum
    Color public myColor = Color.Red; // Enum variable

    function enumToUint() external view returns (uint) {
        return uint(myColor); // Convert enum to uint
    }


    constructor(){

    }
}
