// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// uint128 could be used instead of uint256, even tho uin256>>> uint128, the last one is big enough to store amounts
// have in mind tha the max value for uint128 is 2^128 - 1 (340282366920938463463374607431768211455)
contract Store {
    struct payments {
        // slot 0
        uint128 finalAmount;
        address sender;
        // slot 1
        uint128 amount;
        address receiver;
        // slot 2
        uint128 initialAmount;
        bool valid;
        bool checked;
        uint8 paymentType;

        // slot 3 not needed
        // slot 4 not needed
        // slot 5 not needed
        // slot 6 not needed
    }
    // slot 0
    mapping(address => uint256) balances;
    // slot 1
    uint128 public number;
    address admin;

    // slot 2
    uint8 index;
    bool flag1;
    bool flag2;
    bool flag3;
    address admin2;

    // slot 3
    payments[8] topPayments;

    // slot 4 not needed
    // slot 5 not needed

    constructor() {}

    function setNumber(uint128 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
