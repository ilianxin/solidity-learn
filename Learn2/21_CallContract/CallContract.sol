// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {OtherContract} from "./OtherContract.sol";

contract CallContract {

    function callSetX(address _address, uint _x) external {
        OtherContract(_address).setX(_x);
    }

    function callGetX(OtherContract _address) external view returns(uint256){
        return _address.getX();
    }

    function callGetX2(address _address) external view returns(uint256){
        OtherContract other = OtherContract(_address);
        return other.getX();
    }

    function setXTransferETH(address _address, uint _x) external payable {
        OtherContract(_address).setX{value: msg.value}(_x);
    }

    constructor(){

    }
}
