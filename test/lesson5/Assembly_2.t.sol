// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {Add} from "../../src/lesson5/AssemblyEx_2.sol";

contract Assembly_2_Test is StdInvariant, Test {
    Add public ctr;

    function setUp() public {
        ctr = new Add();
    }

    function test_add(uint256 a, uint256 b) public {
        uint256 result = ctr.addAssembly(a, b);
        uint256 expected;
        unchecked {
            expected = a + b;
        }
        assertEq(result, expected);
    }
}
