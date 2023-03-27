//  SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**@title Publish Token and make a bank
 * @author CJJJJJJJ
 * @notice just take it easy
 * @dev for sure
 */

contract Vault is ERC20 {
    mapping(address => uint256) vault;

    constructor() ERC20("CJ", "Bingo") {
        _mint(msg.sender, 100000 * 10**18);
    }

    function deposite(uint256 amount) public {
        approve(msg.sender, amount);
        transferFrom(msg.sender, address(this), amount);
        vault[msg.sender] += amount;
    }

    function withdraw() public {
        uint256 amount = vault[msg.sender];
        require(amount > 0, "Vault: cannot withdraw zero balance");
        vault[msg.sender] = 0;

        _transfer(address(this), msg.sender, amount);
    }
}