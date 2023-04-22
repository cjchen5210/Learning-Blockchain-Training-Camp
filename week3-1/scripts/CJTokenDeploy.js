const ethers = require("hardhat")

async function main() {
    const contract = await ethers.ethers.getContractFactory("CJToken")
    const CJtoken = await contract.deploy()
    await CJtoken.deployed()
    
    console.log(`the cj token address is ${CJtoken.address}`)
}

main().catch((erorr) => {
    console.log(error, "No! there is an erorr")
    process.exitCode = 1
})