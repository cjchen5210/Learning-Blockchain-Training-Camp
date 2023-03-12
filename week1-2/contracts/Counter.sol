// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Counter {
    uint256 public counter;
    address public owner;

    constructor() {
        counter = 1;
        owner = msg.sender;
    }

    function add(uint256 x) public returns (uint256) {
        require(msg.sender == owner, "Only owner can use the ADD function");
        counter += x;
        return counter;
    }
}
