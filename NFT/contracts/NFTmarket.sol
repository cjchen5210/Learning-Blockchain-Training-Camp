// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";


interface TokenRecipient {
    function tokensReceived(address sender, uint256 amount)
        external
        returns (bool);
}

contract NFT_Market is TokenRecipient, IERC721Receiver {
    
    uint256 public airdropMoney;
    IERC20 public tokenContract;
    IERC721 public nftContract;
    mapping(uint256 => uint256) nftPrice;

    constructor(address _token, address _nftToken) {
        tokenContract = IERC20(_token);
        nftContract = IERC721(_nftToken);
    }

    mapping(address => uint256) public erc20Balance;
    // 总量10 个 token，每次领1个
    // 拿空投，可以在合约里，也可以提出来放自己裤裆里
    function takeAirdrop() external {
        // safeTransferFrom(address(this), msg.sender, 1);
    }

    // 把nft放到合约里，给nft设置价格
    function approveAndSetPrice(uint256 price, uint256 tokenId) external {
        require(nftContract.ownerOf(tokenId) == msg.sender, "Not token owner");  
        nftContract.approve(address(this), tokenId);  
        nftPrice[tokenId] = price; 
    }
    // 使用erc20 token 买 erc 721 的 token
    function buyNFT(uint256 tokenId) external {  
        uint256 price = nftPrice[tokenId];  
        require(price > 0, "Token not for sale");  
  
        address seller = nftContract.ownerOf(tokenId);  
        require(tokenContract.transferFrom(msg.sender, seller, price), "Transfer failed");  
  
        nftContract.safeTransferFrom(seller, msg.sender, tokenId);  
  
        nftPrice[tokenId] = 0;  
    } 

    function tokensReceived(address sender, uint256 amount)
        external
        returns (bool)
    {

    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        // return IERC721Receiver.onERC721Received.selector;
    }

}
