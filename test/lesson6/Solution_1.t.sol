// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {Solution_1} from "../../src/lesson7/Solution_1.sol";

contract Solution_1_Test is StdInvariant, Test {
    Solution_1 public ctr;
    ERC20 public token;
    event QueryExecuted();
    event transferOccurred(address, uint256);

    function setUp() public {
        ctr = new Solution_1();
        token = new ERC20();
    }

    function test_query(uint256 _amount, address _receiver) public {
        if (token.transfer(_receiver, _amount)) {
            vm.expectRevert();
            ctr.query(_amount, _receiver, token.transfer);
        } else {
            vm.expectEmit(address(ctr));
            emit QueryExecuted();
            ctr.query(_amount, _receiver, token.transfer);
        }
    }

    function test_checkCall(address _receiver, uint256 _amount) public {
        bytes memory data = abi.encodeWithSignature(
            "transfer(address,uint256)",
            _receiver,
            _amount
        );
        vm.expectEmit(address(ctr));
        emit transferOccurred(_receiver, _amount);
        ctr.checkCall(data);

        // revert with wrong function signature
        bytes memory data2 = abi.encodeWithSignature(
            "transferWrong(address,uint256)",
            _receiver,
            _amount
        );
        vm.expectRevert();
        ctr.checkCall(data2);
    }
}

contract ERC20 {
    function transfer(address, uint256 _amount) external pure returns (bool) {
        if (_amount % 2 == 0) return true;
        return false;
    }
}
