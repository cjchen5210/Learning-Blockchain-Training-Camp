//  SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";


/**@title Publish Token and make a bank
 * @author CJJJJJJJ
 * @notice just take it easy
 * @dev for sure
 */

interface TokenRecipient {
    function tokensReceived(
        address sender,
        uint amount
    ) external returns (bool);
}

contract CJToken is ERC20, Ownable {
    using Address for address;

    constructor() ERC20("CJ", "Token") onlyOwner {
        _mint(msg.sender, 10000 * 10 ** 18);
    }

    function transferWithCallback(
        address recipient,
        uint256 amount
    ) external returns (bool) {
        _transfer(msg.sender, recipient, amount);

        if (recipient.isContract()) {
            bool rv = TokenRecipient(recipient).tokensReceived(
                msg.sender,
                amount
            );
            require(rv, "No Recipient");
            return rv;
        }
    }
}
