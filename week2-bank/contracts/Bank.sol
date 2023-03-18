// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.7;


/**@title The Bank is built by me !!!
 * @author CJJJJJJJ
 * @notice just take it easy
 * @dev for sure
 */
contract Bank {
    address private immutable i_owner;
    address[] private s_funders;
    mapping(address => uint256) private s_addressToAmountDeposit;
    uint256 private constant MINIMUM_GAS = 50 * 10**8;
    constructor() {
        i_owner = msg.sender;
    }

    event LogFunding(address sender, uint amount);

    function fund() public payable {
        // > 0.01 ether
        require(msg.value > 0, "Deposit amount must be greater than 0");
        require(msg.value >= MINIMUM_GAS, "Gas Limit, man ~");
        s_addressToAmountDeposit[msg.sender] += msg.value;
        s_funders.push(msg.sender);
        emit LogFunding(msg.sender, msg.value);
    }

    function withdraw() public {
        uint256 withdrawAmount = s_addressToAmountDeposit[msg.sender];
        s_addressToAmountDeposit[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: withdrawAmount}(new bytes(0));
        
        require(success, "Withdrawal failed");
    }

    function getOwner() public view returns (address) {
        return i_owner;
    }

    
}
