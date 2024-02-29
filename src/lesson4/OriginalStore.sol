// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {
    struct payments {
        // slot 0
        bool valid;
        // slot 1
        uint256 amount;
        // slot 2
        address sender;
        uint8 paymentType;
        // slot 3
        uint256 finalAmount;
        // slot 4
        address receiver;
        // slot 5
        uint256 initialAmount;
        // slot 6
        bool checked;
    }
    // slot 0
    uint8 index;
    // slot 1
    uint256 public number;
    // slot2
    bool flag1;
    address admin;
    // slot 3
    mapping(address => uint256) balances;
    // slot 4
    bool flag2;
    address admin2;
    bool flag3;
    // slot 5
    payments[8] topPayments;

    constructor() {}

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
