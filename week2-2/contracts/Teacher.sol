import "./Score.sol";
//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Teacher {
    IScore score;

    constructor(address s) {
        score = IScore(s);
    }

    function callSetScore(address student, uint ss) public {
        score.setScore(student, ss);
    } 
}