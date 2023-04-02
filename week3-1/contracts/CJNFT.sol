//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";


interface TokenPriceSet {
    function setTokenPrice(
        uint256 price,
        uint256 tokenId
    ) external returns (bool);
}

contract CJNFT is ERC721URIStorage, Ownable {
    mapping(uint256 => uint256) public tokenPrice;

    using Counters for Counters.Counter;
    Counters.Counter private CJTokenId;

    // mint -> nft
    // get nft price
    // set nft price
    // buy nft token

    constructor() ERC721("CJNFT", "CJBingo") {
        CJTokenId = Counters.Counter(0);
    }

    function mint(address to, string memory tokenURI) public returns (uint256) {
        uint256 newItemId = CJTokenId.current();
        _mint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);
        CJTokenId.increment();
        return newItemId;
    }

    function setTokenPrice(uint256 price, uint256 tokenId) external onlyOwner {
        require(msg.sender == owner());
        tokenPrice[tokenId] = price;
    }
}
