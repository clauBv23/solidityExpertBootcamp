// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * The parameter X represents a function.
 * Complete the function signature so that X is a
 * standard ERC20 transfer function (other than
 * the visibility)
 * The query function should revert if the ERC20
 * function returns false
 */
contract Solution_1 {
    event QueryExecuted();

    function query(
        uint _amount,
        address _receiver,
        function(address, uint256) external returns (bool) _func
    ) external {
        if (_func(_receiver, _amount)) {
            revert();
        }
        emit QueryExecuted();
    }

    event transferOccurred(address, uint256);

    /**
     *
     * @param data The data parameter is bytes encoded
     *      representing the following Function selector Target address Amount (uint256)
     * Complete the function body as follows
     * The function should revert if the function is not
     * an ERC20 transfer function.
     * Otherwise extract the address and amount from
     * the data variable and emit an event with those
     * details
     * event transferOccurred(address,uint256);
     */
    function checkCall(bytes calldata data) external {
        (bytes4 _funcSelector, address _target, uint256 _amount) = abi.decode(
            data,
            (bytes4, address, uint256)
        );
        if (_funcSelector != bytes4(keccak256("transfer(address,uint256)"))) {
            revert();
        }
        emit transferOccurred(_target, _amount);
    }
}
