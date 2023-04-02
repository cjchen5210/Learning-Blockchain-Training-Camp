// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

interface TokenRecipient {
    function tokensReceived(
        address sender,
        uint256 amount
    ) external returns (bool);
}

interface TokenPriceSet {
    function setTokenPrice(
        uint256 price,
        uint256 tokenId
    ) external returns (bool);
}

contract NFT_Market is TokenRecipient, TokenPriceSet {
    mapping(address => uint256) public addressToBalance;
    address public immutable token;
    address public immutable nftToken;
    mapping(uint256 => uint256) public nftToPrice;

    constructor(address _token, address _nftToken) {
        token = _token;
        nftToken = _nftToken;
    }

    function tokensReceived(
        address sender,
        uint256 amount
    ) external returns (bool) {
        require(msg.sender == token, "invalid");
        addressToBalance[sender] += amount;
        return true;
    }

    function withdraw() external {
        uint256 amount = addressToBalance[msg.sender];
        require(amount > 0, "No balance to withdraw");
        require(IERC20(token).transfer(msg.sender, amount));
        addressToBalance[msg.sender] = 0;
    }

    // 设置NFT价格
    function setTokenPrice(
        uint256 price,
        uint256 tokenId
    ) external returns (bool) {
        nftToPrice[tokenId] = price;
        return true;
    }

    function buyNFT() external {
        // nft price
        addressToBalance[msg.sender];
        // ERC-20 transfer

        // ERC-721 transfer
    }
}
