// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            // to return you need to specify address and the size from the starting point
            let new_variable := mol
            // mstore(freeMem, new_variable) // on the first 0x20(32) bytes is stored mol
            mstore(0x40, new_variable)
            return(0x40, 0x20)
        }
    }
}
