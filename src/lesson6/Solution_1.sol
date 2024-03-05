// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

/**
 * Create a Solidity contract with one function
 * The solidity function should return the amount of ETH that was passed to it, and the function
 * body should be written in assembly
 */
contract Solution_1 {
    function getEthValue() public payable returns (uint256 value) {
        assembly {
            value := callvalue()
        }
    }
}
