// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {SubOverflow} from "../../src/lesson5/AssemblyEx_3.sol";

contract Assembly_3_Test is StdInvariant, Test {
    SubOverflow public ctr;

    function setUp() public {
        ctr = new SubOverflow();
    }

    function test_subtract(uint256 a, uint256 b) public {
        uint256 result = ctr.subtract(a, b);
        if (a > b) {
            assertEq(result, a - b);
        } else {
            assertEq(result, 0);
        }
    }
}
