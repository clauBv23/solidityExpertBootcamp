// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

/**
 * Write some Yul to
 * 1. Add 0x07 to 0x08
 * 2. store the result at the next free memory location.
 * 3. (optional) write this again in opcodes
 */
contract Solution_4 {
    function add() public pure returns (uint256 result) {
        assembly {
            result := add(0x07, 0x08)
        }
    }
}

// opcode
/*
6007600801

PUSH1 0x07
PUSH1 0x08
ADD

*/
