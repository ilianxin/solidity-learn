// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;


contract Yeye {

    event YeyeLog(string message);

    function hip() public virtual {
        emit YeyeLog("Yeye says hip!");
    }

    function hop() public virtual {
        emit YeyeLog("Yeye says hop!");
    }

    function yeye() public virtual {
        emit YeyeLog("Yeye says yeye!");
    }

    constructor(){

    }
}

contract Baba is Yeye {

    function hip() public override {
        emit YeyeLog("Baba says hip!");
    }

    function hop() public override {
        emit YeyeLog("Baba says hop!");
    }

    function yeye() public override {
        emit YeyeLog("Baba says yeye!");
    }

    constructor(){

    }
}

contract TT is Yeye, Baba {

    function hip() public override(Yeye, Baba) {
        emit YeyeLog("TT says hip!");
    }

    function hop() public override(Yeye, Baba) {
        emit YeyeLog("TT says hop!");
    }

    function yeye() public override(Yeye, Baba) {
        emit YeyeLog("TT says yeye!");
    }

    constructor(){

    }
}

contract KK is Yeye, Baba {

    function hip() public override(Yeye, Baba) {
        super.hip();
        emit YeyeLog("KK says hip!");
    }

    function hop() public override(Yeye, Baba) {
        super.hop();
        emit YeyeLog("KK says hop!");
    }

    function yeye() public override(Yeye, Baba) {
        super.yeye();
        emit YeyeLog("KK says yeye!");
    }

    constructor(){

    }
}

contract Person is TT, KK {

    function hip() public override(TT, KK) {
        super.hip();
        emit YeyeLog("Person says hip!");
    }

    function hop() public override(TT, KK) {
        super.hop();
        emit YeyeLog("Person says hop!");
    }

    function yeye() public override(TT, KK) {
        super.yeye();
        emit YeyeLog("Person says yeye!");
    }

    constructor(){

    }
}

contract Inheritance {
}