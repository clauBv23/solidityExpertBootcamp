// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
    Write a function that will delete items (one at a
    time) from a dynamic array without leaving
    gaps in the array. You should assume that the
    items to be deleted are chosen at random, and
    try to do this in a gas efficient manner.
    For example imagine your array has 12 items
    and you need to delete the items at indexes 8,
    2 and 7.
    The final array will then have items
    {0,1,3,4,5,6,9,10,11}
 */
contract Solution_2 {
    uint256[] public items;

    error OutOfRange(uint256 position, uint256 length);
    error ItemNotFound(uint256 value);

    constructor(uint256[] memory items_) {
        items = items_;
    }

    function deleteItemByPos(uint256 position_) external {
        uint256 _length = itemsCount();

        if (position_ >= _length) {
            revert OutOfRange(position_, _length);
        }

        if (position_ == _length - 1) {
            items.pop();
        } else {
            items[position_] = items[_length - 1];
            items.pop();
        }
    }

    function deleteItemByValue(uint256 value_) external {
        uint256 _length = itemsCount();
        uint256 _itemPos = findItem(value_);

        if (_itemPos == _length - 1) {
            items.pop();
        } else {
            items[_itemPos] = items[_length - 1];
            items.pop();
        }
    }

    function findItem(uint256 value_) public view returns (uint256) {
        uint256 _length = itemsCount();
        for (uint256 i = 0; i < _length; i++) {
            if (items[i] == value_) {
                return i;
            }
        }
        revert ItemNotFound(value_);
    }

    function itemsCount() public view returns (uint256) {
        return items.length;
    }
}
