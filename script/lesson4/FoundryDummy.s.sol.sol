// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Script, console2} from "forge-std/Script.sol";

contract Dummy is Script, Test {
    uint256 mainnetFork;
    uint256 mumbaiFork;
    uint256 sepoliaFork;

    // uint256 optimismFork;

    function run() public {
        mainnetFork = vm.createFork(vm.envString("MAINNET_RPC_URL"));
        mumbaiFork = vm.createFork(vm.envString("MUMBAI_RPC_URL"));
        sepoliaFork = vm.createFork(vm.envString("SEPOLIA_RPC_URL"));

        vm.selectFork(mainnetFork);
        console.log("Mainnet last block =>", vm.getBlockNumber());

        vm.selectFork(mumbaiFork);
        console.log("Mumbai last block =>", vm.getBlockNumber());

        vm.selectFork(sepoliaFork);
        console.log("Sepolia last block =>", vm.getBlockNumber());
    }
}
