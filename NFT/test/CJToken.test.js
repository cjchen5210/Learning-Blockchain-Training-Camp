const ethers = require("hardhat")
const {assert, expect} = require("chai")

describe("Test CJToken", () => {
    beforeEach(async () => {
        const TokenContract = await ethers.ethers.getContractFactory("CJToken");
        const contract = await TokenContract.deploy();
        await contract.deployed();
    });

})