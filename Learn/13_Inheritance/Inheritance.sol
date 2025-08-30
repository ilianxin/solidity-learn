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

    function hip() public virtual override {
        emit YeyeLog("Baba says hip!");
    }

    function hop() public virtual override {
        emit YeyeLog("Baba says hop!");
    }

    function yeye() public virtual override {
        emit YeyeLog("Baba says yeye!");
    }

    constructor(){

    }
}

contract TT is Yeye, Baba {

    function hip() public virtual override(Yeye, Baba) {
        emit YeyeLog("TT says hip!");
    }

    function hop() public virtual override(Yeye, Baba) {
        emit YeyeLog("TT says hop!");
    }

    function yeye() public virtual override(Yeye, Baba) {
        emit YeyeLog("TT says yeye!");
    }

    constructor(){

    }
}

contract KK is Yeye, Baba {

    function hip() public virtual override(Yeye, Baba) {
        super.hip();
        emit YeyeLog("KK says hip!");
    }

    function hop() public virtual override(Yeye, Baba) {
        super.hop();
        emit YeyeLog("KK says hop!");
    }

    function yeye() public virtual override(Yeye, Baba) {
        super.yeye();
        emit YeyeLog("KK says yeye!");
    }

    constructor(){

    }
}

contract Person is TT, KK {

    function hip() public virtual override(TT, KK) {
        super.hip();
        emit YeyeLog("Person says hip!");
    }

    function hop() public virtual override(TT, KK) {
        super.hop();
        emit YeyeLog("Person says hop!");
    }

    function yeye() public virtual override(TT, KK) {
        super.yeye();
        emit YeyeLog("Person says yeye!");
    }

    constructor(){

    }
}

contract Inheritance {

    Person person;

    constructor(){
        person = new Person();
    }

    function hip() public {
        person.hip();
    }

    function hop() public {
        person.hop();
    }

    function yeye() public {
        person.yeye();
    }
}