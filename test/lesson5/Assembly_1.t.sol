// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {Intro} from "../../src/lesson5/AssemblyEx_1.sol";

contract Assembly_1_Test is StdInvariant, Test {
    Intro public ctr;
    uint16 mol = 420;

    function setUp() public {
        ctr = new Intro();
    }

    function test_intro() public {
        assertEq(ctr.intro(), mol);
    }
}
