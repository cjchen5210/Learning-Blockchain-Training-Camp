// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";

interface TokenRecipient {
    function tokensReceived(address sender, uint256 amount)
        external
        returns (bool);
}

contract NFT_Market is TokenRecipient, IERC721Receiver {
    
    uint256 public airdropMoney;
    IERC20 public tokenContract;
    IERC721 public nftContract;

    constructor(address _token, address _nftToken) {

    }
    mapping(address => uint256) public erc20Balance;
    // 总量10 个 token，每次领1个
    // 拿空投，可以在合约里，也可以提出来放自己裤裆里
    function takeAirdrop() external {
        safeTransferFrom(address(this), msg.sender, 1);
    }
    function 
    // 把nft放到合约里，给nft设置价格

    // 使用erc20 token 买 erc 721 的 token


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
