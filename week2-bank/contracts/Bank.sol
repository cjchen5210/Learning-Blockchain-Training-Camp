// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.7;

// 2. Imports
// import "@openzeppelin/contracts/utils/math/SafeMath.sol";
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
// import "./PriceConverter.sol";
// using SafeMath for uint256;
// 3. Interfaces, Libraries, Contracts
// error FundMe__NotOwner();

/**@title The Bank is built by me !!!
 * @author CJJJJJJJ
 * @notice just take it easy
 * @dev for sure
 */
contract Bank {
    address private immutable i_owner;
    address[] private s_funders;
    mapping(address => uint256) private s_addressToAmountFunded;

    constructor() {
        i_owner = msg.sender;
    }

    // modifier onlyOwner {
    //     if (msg.sender != i_owner) revert Bank__NotOwner();
    //     _;
    // }

    function fund() public payable {
        // > 0.01 ether
        require(msg.value >= 10000000000000000);
        s_addressToAmountFunded[msg.sender] = msg.value;
        s_funders.push(msg.sender);
    }

    function withdraw(uint256 amount) public {
        // for (uint fundIndex = 0; fundIndex < s_funders
        // .length; fundIndex++) {
        //     address funder = s_funders[fundIndex];
        //     s_addressToAmountFunded[funder] = 0;
        // }
        // s_funders = new address[](0);
        require(amount > 0, "Amount must be greater than 0"); // 检查提款金额是否大于0
        require(address(this).balance >= amount, "Insufficient balance"); // 检查余额是否足够
        require(
            msg.sender == i_owner,
            "Only the contract owner can withdraw funds"
        ); // 仅允许合约拥有者提款
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }

    function getOwner() public view returns (address) {
        return i_owner;
    }
}
