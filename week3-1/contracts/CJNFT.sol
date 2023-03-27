//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract CJNFT is ERC721("CJNFT", "CJBingo"), Ownable {
    mapping(uint256 => uint256) private _tokenPrices;

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
        // approve(to, tokenId);
    }

    // 设置NFT的价格
    function setToken(uint256 tokenId, uint256 price) external {
        require(ownerOf(tokenId) == msg.sender, "U are not the NFT's Owner");
        require(price > 0, "The price must be bigger thant Zeroooo -> 0");
        _tokenPrices[tokenId] = price;
    }

    // 买入NFT，用ETH
    function buyToken(uint256 tokenId) external payable {
        require(_exists(tokenId), "the NFT does not exist");
        uint256 price = _tokenPrices[tokenId];
        require(price > 0, "the NFT not for sale");
        require(msg.value > price, "money is not enough");
        address tokenOwner = ownerOf(tokenId);
        require(tokenOwner != address(0), "invalid Owner");
        _transfer(tokenOwner, msg.sender, tokenId);
        (bool success, ) = msg.sender.call{value: price}("PAY!");
        require(success, "PAY FAILED~");
        approve(msg.sender, tokenId);
    }
    // 出售转让NFT，用ETH 

    // 查看NFT的价格，用ETH
    function getTokenPrice(uint256 tokenId) external view returns(uint256) {
        return _tokenPrices[tokenId];
    }
    // 了解这笔交易的流程

}