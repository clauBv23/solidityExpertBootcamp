// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Solution_2} from "../src/lesson2/Solution_2.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract Solution_2_Test is StdInvariant, Test {
    event ItemDeleted(uint256 position, uint256 value);

    error OutOfRange(uint256 position, uint256 length);
    error ItemNotFound(uint256 value);

    Solution_2 public solution;
    uint256[] public items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    function setUp() public {
        solution = new Solution_2(items);
        targetContract(address(solution));
    }

    function test_DeleteItemByPos(uint256 pos_) public {
        uint256 _lengthBefore = solution.itemsCount();

        if (pos_ >= _lengthBefore) {
            vm.expectRevert(
                abi.encodeWithSelector(OutOfRange.selector, pos_, _lengthBefore)
            );
            solution.deleteItemByPos(pos_);
            return;
        }

        uint256 _itemAtPosBefore = solution.items(pos_);

        // expect event
        vm.expectEmit(address(solution));
        emit ItemDeleted(pos_, _itemAtPosBefore);

        // delete item
        solution.deleteItemByPos(pos_);

        // check previous item at pos_ was removed
        if (pos_ == _lengthBefore - 1) {
            vm.expectRevert();
            solution.items(pos_);
        } else {
            uint256 _itemAtPosAfter = solution.items(pos_);
            assertNotEq(_itemAtPosBefore, _itemAtPosAfter);
        }

        // check length
        assertEq(solution.itemsCount(), _lengthBefore - 1);

        // check previous item at pos_ was removed
        if (pos_ == _lengthBefore - 1) {
            vm.expectRevert();
            solution.items(pos_);
        } else {
            uint256 _itemAtPosAfter = solution.items(pos_);
            assertNotEq(_itemAtPosBefore, _itemAtPosAfter);
        }
    }

    function test_DeleteItemByPos11(uint256 pos_) public {
        uint256 _lengthBefore = solution.itemsCount();

        if (pos_ >= _lengthBefore) {
            vm.expectRevert(
                abi.encodeWithSelector(OutOfRange.selector, pos_, _lengthBefore)
            );
            solution.delete_at_index(pos_, false);
            return;
        }

        uint256 _itemAtPosBefore = solution.items(pos_);

        // // expect event
        // vm.expectEmit(address(solution));
        // emit ItemDeleted(pos_, _itemAtPosBefore);

        // delete item
        solution.delete_at_index(pos_, false);

        // check previous item at pos_ was removed
        if (pos_ == _lengthBefore - 1) {
            vm.expectRevert();
            solution.items(pos_);
        } else {
            uint256 _itemAtPosAfter = solution.items(pos_);
            assertNotEq(_itemAtPosBefore, _itemAtPosAfter);
        }

        // check length
        assertEq(solution.itemsCount(), _lengthBefore - 1);

        // check previous item at pos_ was removed
        if (pos_ == _lengthBefore - 1) {
            vm.expectRevert();
            solution.items(pos_);
        } else {
            uint256 _itemAtPosAfter = solution.items(pos_);
            assertNotEq(_itemAtPosBefore, _itemAtPosAfter);
        }
    }

    function test_DeleteItemByValue(uint256 value_) public {
        uint256 _lengthBefore = solution.itemsCount();

        if (value_ > 11) {
            vm.expectRevert(
                abi.encodeWithSelector(ItemNotFound.selector, value_)
            );
            solution.deleteItemByValue(value_);
            return;
        }

        uint256 _itemPos = solution.findItem(value_);

        // expect event
        vm.expectEmit(address(solution));
        emit ItemDeleted(_itemPos, value_);

        // delete item
        solution.deleteItemByValue(value_);

        // check
        assertEq(solution.itemsCount(), _lengthBefore - 1);
        vm.expectRevert(abi.encodeWithSelector(ItemNotFound.selector, value_));
        solution.findItem(value_);
    }

    function invariant_Delete() public view {
        assert(solution.itemsCount() <= 12);
        assert(solution.itemsCount() >= 0);
    }
}
