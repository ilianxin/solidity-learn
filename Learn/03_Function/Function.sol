// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Function {

    uint256 public number = 1; // Unsigned Integer

    function add() external  {
        number = number +1 ;

    }

    function addPure(uint256 _number) external pure returns (uint256) {
        return _number +1 ;

    }

    function addView() external view returns (uint256) {
        return number +1 ;

    }

    function minus() internal  {
        number = number -1 ;

    }

    function minusPublic() external  {
        minus();

    }

    function minusPayable() external payable returns (uint256 balance) {
        minus();

        balance = address(this).balance;

    }

    constructor(){

    }
}
