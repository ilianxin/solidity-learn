pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract ContractBTest is Test {
    uint256 testNumber;

    function setUp() public {
        testNumber = 42;
    }

    // 外部函数：用于通过 external 调用触发 underflow revert
    function subtract43External() external {
        testNumber -= 43;
    }

    function test_RevertWhen_Subtract43() public {
        vm.expectRevert(stdError.arithmeticError);
        this.subtract43External();
    }

    // function test_CannotSubtract43() public {
    //     vm.expectRevert(stdError.arithmeticError);
    //     console2.log("currentNumber= %d", testNumber);
    //     testNumber -= 43;
    // }

}