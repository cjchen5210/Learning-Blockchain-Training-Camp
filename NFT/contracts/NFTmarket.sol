// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
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
    IERC20 public immutable tokenContract;
    IERC721 public immutable nftContract;

    constructor(address _token, address _nftToken) {
        tokenContract = IERC20(_token);
        nftContract = IERC721(_nftToken);
    }
    mapping(address => uint256) public erc20Balance;
    // 总量10 个 token，每次领1个
    // 拿空投，可以在合约里，也可以提出来放自己裤裆里
    // function takeAirdrop() external {
    //     tokenContract.safeTransferFrom(address(this), msg.sender, 1);
    // }
    
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
        return IERC721Receiver.onERC721Received.selector;
    }

    // // video example
    // function depositNFT(uint256 tokenId) external {
    //     nft.safeTransferFrom(msg.sender, address(this), tokenId);
    // }
    

    // // 放入合约，允许合约进行交易
    // function approvalMarket(uint256 tokenId) external returns(bool) {
    //     nft.approve(address(this), tokenId);
    //     return true;
    // }
    // // 对放入合约的nft设置价格
    // function setNFTPrice(uint256 tokenId, uint256 price) external returns(bool) {
    //     priceOfNFT[tokenId] = price;
    //     return true;
    // }
    // // 接受支付，转移nft的所有权
    // function buyNFT(uint256 tokenId) external returns(bool) {
    //     nft.safeTransferFrom(address(this), msg.sender, tokenId);
    //     return true;
    // }

}
