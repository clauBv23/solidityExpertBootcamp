// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Solution_2} from "../src/lesson2/Solution_2.sol";

contract Solution_2_Test is Test {
    error OutOfRange(uint256 position, uint256 length);
    error ItemNotFound(uint256 value);

    Solution_2 public solution;
    uint256[] public items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    function setUp() public {
        solution = new Solution_2(items);
    }

    function test_DeleteItemByPos(uint256 pos_) public {
        uint256 _length = items.length;
        if (pos_ >= _length) {
            vm.expectRevert(
                abi.encodeWithSelector(OutOfRange.selector, pos_, _length)
            );
            solution.deleteItemByPos(pos_);
        } else {
            uint256 _itemAtPosBefore = solution.items(pos_);

            solution.deleteItemByPos(pos_);

            uint256 _itemAtPosAfter = solution.items(pos_);

            // check
            assertEq(solution.itemsCount(), _length - 1);
            assertNotEq(_itemAtPosBefore, _itemAtPosAfter);
        }
    }

    function test_DeleteItemByValue(uint256 value_) public {
        uint256 _length = items.length;
        if (value_ > 11) {
            vm.expectRevert(
                abi.encodeWithSelector(ItemNotFound.selector, value_)
            );
            solution.deleteItemByValue(value_);
        } else {
            solution.deleteItemByValue(value_);

            // check
            assertEq(solution.itemsCount(), _length - 1);
            vm.expectRevert(
                abi.encodeWithSelector(ItemNotFound.selector, value_)
            );
            solution.findItem(value_);
        }
    }
}
