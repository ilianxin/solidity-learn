// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract CallContract {

    event Response(bool success, bytes data);

    function callSetX(address _addr, uint _x) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        emit Response(success, data);
    }

    function callGetX(address _addr) public returns (uint256) {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );
        emit Response(success, data);
        require(success, "call failed");
        return abi.decode(data, (uint256));
    }

    function callNonExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo()")
        );
        emit Response(success, data);
    }

    constructor(){

    }
}
