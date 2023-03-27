const {assert, expect} = require("chai");
const ethers = require("hardhat");


describe("Test CJToken", () => {
    beforeEach(async () => {
        const TokenContract = await ethers.ethers.getContractFactory("CJToken");
        const contract = await TokenContract.deploy();
        await contract.deployed();
    });

})