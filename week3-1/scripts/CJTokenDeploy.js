const ethers = require("hardhat")

async function main() {
    const contract = await ethers.ethers.getContractFactory("CJToken")
    const CJtoken = await contract.deploy()
    await CJtoken.deployed()
    
    console.log(`the cj token address is ${CJtoken.address}`)
    console.log(`the deployer is ${CJtoken.signer}`)
}

main().catch((error) => {
    console.log(error, "No! there is an erorr")
    process.exitCode = 1
})