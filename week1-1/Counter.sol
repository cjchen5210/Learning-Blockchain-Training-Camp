// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  ^0.8.0;

contract Counter {

    uint256 public counter;

    constructor() {
        counter = 0;
    }

    function add(uint256 x) public returns (uint256) {
        counter += x;
        return counter;
    }
}