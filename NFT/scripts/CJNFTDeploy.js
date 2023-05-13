const hre = require("hardhat")
const ethers = require("ethers")
const cjNFTABI = require("../artifacts/contracts/CJNFT.sol/nftToken.json").abi
const smile0 = require("../metaNFT/smile0.json").image
async function main() {
    const contract = await hre.ethers.getContractFactory("nftToken")
    const nftContract = await contract.deploy()
    await nftContract.deployed()
    const owner = nftContract.signer.address
    console.log(`owner address is ${owner}`)
    console.log(`the contract address is ${nftContract.address}`)
    const cjNFTContract = new ethers.Contract(nftContract.address, cjNFTABI, nftContract.signer)
    
    await cjNFTContract.mintNFT(owner, smile0)
    const balance = await cjNFTContract.balanceOf(owner)
    console.log(`the nft balance of owner ${balance}`)
}

main().catch((error) => {
    console.log(error)
    process.exitCode = 1
})