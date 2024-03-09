// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {Scope} from "../../src/lesson5/AssemblyEx_4.sol";

contract Assembly_3_Test is StdInvariant, Test {
    Scope public ctr;

    function setUp() public {
        ctr = new Scope();
    }

    function test_increment(uint256 inc) public {
        uint256 count = ctr.count();
        ctr.increment(inc);
        uint256 newCount;
        unchecked {
            newCount = count + inc;
        }
        assertEq(ctr.count(), newCount);
        // uint256 result = ctr.subtract(a, b);
        // if (a > b) {
        //     assertEq(result, a - b);
        // } else {
        //     assertEq(result, 0);
        // }
    }
}
