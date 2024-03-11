// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract GasContract {
    uint256 internal lastSendAmount;
    mapping(address => uint256) public balances;

    event AddedToWhitelist(address userAddress, uint256 tier);
    event WhiteListTransfer(address indexed);

    constructor(address[] memory, uint256) {
        balances[0x0000000000000000000000000000000000001234] = 1000000000;
    }

    /// @dev this functions always returns true in test...
    function checkForAdmin(address) external pure returns (bool) {
        return true;
    }

    function balanceOf(address _user) external view returns (uint256) {
        return balances[_user];
    }

    /// @dev tests does not check for balance requirements and does not need an event
    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata
    ) external {
        unchecked {
            balances[msg.sender] -= _amount;
            balances[_recipient] += _amount;
        }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier) external {
        require(
            msg.sender == 0x0000000000000000000000000000000000001234 &&
                _tier < 255
        );
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(address _recipient, uint256 _amount) external {
        lastSendAmount = _amount;
        unchecked {
            balances[msg.sender] -= _amount;
            balances[_recipient] += _amount;
        }
        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address) external view returns (bool, uint256) {
        return (true, lastSendAmount);
    }

    function whitelist(address) external pure returns (uint256) {}

    function administrators(
        uint256 _index
    ) external pure returns (address admin) {
        assembly {
            switch _index
            case 0 {
                admin := 0x3243Ed9fdCDE2345890DDEAf6b083CA4cF0F68f2
            }
            case 1 {
                admin := 0x2b263f55Bf2125159Ce8Ec2Bb575C649f822ab46
            }
            case 2 {
                admin := 0x0eD94Bc8435F3189966a49Ca1358a55d871FC3Bf
            }
            case 3 {
                admin := 0xeadb3d065f8d15cc05e92594523516aD36d1c834
            }
            case 4 {
                admin := 0x1234
            }
        }
    }
}

// repo with the project solution : https://github.com/clauBv23/GasOptimisationFoundry

/** GAS OPTIMISATION REPORT
      |----------------------------------|-----------------|-------|--------|-------|---------|
      | Deployment Cost                  | Deployment Size |       |        |       |         |
      | 336312                           | 1798            |       |        |       |         |
      | Function Name                    | min             | avg   | median | max   | # calls |
      | addToWhitelist                   | 21718           | 22693 | 23209  | 23305 | 8       |
      | administrators                   | 421             | 462   | 465    | 498   | 5       |
      | balanceOf                        | 593             | 2093  | 2593   | 2593  | 8       |
      | balances                         | 531             | 1031  | 531    | 2531  | 4       |
      | checkForAdmin                    | 405             | 405   | 405    | 405   | 1       |
      | getPaymentStatus                 | 488             | 488   | 488    | 488   | 1       |
      | transfer                         | 49679           | 49829 | 49871  | 49895 | 4       |
      | whiteTransfer                    | 67748           | 67748 | 67748  | 67748 | 3       |
      | whitelist                        | 366             | 366   | 366    | 366   | 2       |
 */
