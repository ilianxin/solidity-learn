// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract InitialValue {
    bool public b;               // false
    string public s;             // ""
    int public i;                // 0
    uint public u;               // 0
    enum E {A, B, C}  // A
    E public e;                 // E.A
    address public addr;         // 0x
function fi() internal{}
function fe() external{}

uint[8]public arr;          // [0,0,0,0,0,0,0,0]
uint[]  public arr2;         // []
mapping(uint => address) public map; // all keys map to 0x

struct S {
    uint id;                 // 0
    string name;             // ""
}

S public s1;                // S(0, "")

bool public t;

function deleteT() public {

delete t;                  // t = false
}


    constructor(){

    }
}
