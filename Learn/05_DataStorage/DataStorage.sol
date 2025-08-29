// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract DataStorage {

    uint[] x = [1,2,3];

    uint public y = 5;
    uint public z;
    string public s;

    function fCallDate(uint[] calldata _x) external pure returns(uint[] calldata){
        return _x;
    }

    function fStorage() public {
        uint[] storage y = x;
        y[0] = 10;

    }

    function foo() external {
        uint[] memory z = new uint[](3);
        z[0] = 1;
        z[1] = 2;
        z[2] = 3;

        s = "Hello World";
    }

    function global() external view returns(uint, uint, address, uint){
        return (block.timestamp, block.number, msg.sender, tx.gasprice);
    }

    function weiUnit() external pure returns(uint){
        assert(1 wei == 1e0);
        assert(1 wei == 1);
        return 1 wei;
    }


    function gweiUnit() external pure returns(uint){
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }


    function etherUnit() external pure returns(uint){
        assert(1 ether == 1e18);
        assert(1 ether == 1000000000000000000);
        return 1 ether;
    }

    function timeUnits() external pure returns(uint, uint, uint, uint){
        assert(1 seconds == 1);
        assert(1 minutes == 60);
        assert(1 hours == 3600);
        assert(1 days == 86400);
        assert(1 weeks == 604800);
        return (1 seconds, 1 minutes, 1 hours, 1 days);
    }

    constructor(){

    }
}
