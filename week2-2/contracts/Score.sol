//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Score {

    mapping (address => uint) public studentScore;
    address public owner;
    address public teacher;

    error NotTeacher();
    error ScoreOver();

    constructor() {
        owner = msg.sender;
    }

    function setTeacher(address tc) public {
        if (score > 100) revert ScoreOver();
        teacher = tc;
    }

    function setScore(address student, uint score) external onlyTeacher {
        studentScore[student] = score;
    }

    modifier onlyTeacher {
        if (teacher != msg.sender) {
            revert NotTeacher();
        }
        _;
    }
}

interface IScore {
    function setScore(address student, uint score) external; 
}
