// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "../src/Counter.sol";

contract ContractTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(15);
    }

    // should pass if number is 15
    function testGetNumber() public {
        uint256 value = counter.getNumber();
        assertEq(value, 15);
        emit log_named_uint("The value is:", value);
    }

    // should pass if value after increament by 1 is 16
    function testIncreament() public {
        counter.increment();
        uint256 value = counter.getNumber();
        assertEq(value, 16);
        emit log_named_uint("The value is:", value);
    }

    // should pass if value after decreament by 1 is 14
    function testDecreament() public {
        counter.decreament();
        uint256 value = counter.getNumber();
        assertEq(value, 14);
        emit log_named_uint("The value is:", value);
    }
}
