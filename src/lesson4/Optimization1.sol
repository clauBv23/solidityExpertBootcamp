// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {
    struct payments {
        // slot 0
        uint256 amount;
        // slot 1
        uint256 finalAmount;
        // slot 2
        uint256 initialAmount;
        // slot 3
        address sender;
        uint8 paymentType;
        bool valid;
        bool checked;
        // slot 4
        address receiver;

        // slot 5 not needed
        // slot 6  not needed
    }

    // slot 0
    uint256 public number;
    // slot 1
    mapping(address => uint256) balances;
    // slot 2
    address admin;
    bool flag1;
    bool flag2;
    bool flag3;
    uint8 index;
    // slot 3
    address admin2;
    // slot 4
    payments[8] topPayments;

    // slot 5 not needed

    constructor() {}

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
