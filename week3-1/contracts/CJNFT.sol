//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";

contract nftToken is ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private MyTokenId;

    constructor () ERC721("CJNFT", "Bingo") {
        MyTokenId = Counters.Counter(0);
    }

    function mintNFT(address to, string memory tokenURI) public returns(uint256) {
        uint256 newItemId = MyTokenId.current();
        _mint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);
        MyTokenId.increment();
        return newItemId;
    }
}
