// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract ArrayAndStruct {

    uint32[5] public arr1 = [1,2,3,4,5];
    bytes1[3] public arr2 ;
    address[2] public arr3;

    uint[] arr4;
    bytes[] arr5;
    address[] arr6;

    function setMemoryArray() public pure{

        uint[] memory arr7 = new uint[](5);

        arr7[0] = 1;
        arr7[1] = 2;
        arr7[2] = 3;
        arr7[3] = 4;
        arr7[4] = 5;
    }


    function arrayPush() public {
        arr4.push();
        arr4.push(1);
        arr5.push("a");
        arr6.push(msg.sender);
    }

    struct Student {
        uint id;
        string name;
        uint age;
    }

    Student student;

    function initStudent() public pure returns(Student memory){
        Student memory student = Student(1, "Alice", 20);
        return student;
    }

    function initStudentP() external {
        Student storage _student = student;
        _student.age = 18;
        _student.id = 3;
        _student.name = "Ale";
    }

    function initStudentR() external {
        student.id = 2;
        student.age = 10;
        student.name = "Bob";
    }

    function initStudentK() external {
        student = Student({id:4, name:"Cathy", age:19});
    }

    constructor(){

    }
}
