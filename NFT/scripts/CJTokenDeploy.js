const ethers = require("hardhat")
const theRealethers = require("ethers")
const cjtokenABI = require("../artifacts/contracts/CJToken.sol/CJToken.json").abi
async function main() {
    const contract = await ethers.ethers.getContractFactory("CJToken")
    const CJtoken = await contract.deploy()
    await CJtoken.deployed()
    const owner = CJtoken.signer.address
    console.log(`the cj token contract ${CJtoken}`)
    // console.log(`the balance of owner ${balanceOfOwner}`)
    console.log(`the cj token address is ${CJtoken.address}`)
    console.log(`the contract owner is ${CJtoken.signer.address}`)
    // console.log(cjtokenABI)
    const cjTokenContract = new theRealethers.Contract(CJtoken.address, cjtokenABI, CJtoken.signer)
    const balance = await cjTokenContract.balanceOf(CJtoken.address)
    const totalSupply = await cjTokenContract.totalSupply()
    // console.log(`balance of owner is ${balance}`)
    console.log(`total supply is fucking ${totalSupply}`)
    const name = await cjTokenContract.name()
}

main().catch((error) => {
    console.log(error, "No! there is an erorr")
    process.exitCode = 1
})