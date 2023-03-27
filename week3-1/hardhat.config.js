require("@nomicfoundation/hardhat-toolbox");
require("dotnet");
require("hardhat-deploy");

const PRIVATE_KEY = process.env.PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "hardhat",
  networks: {
    sepolia: {
      chainId: 8001,
      accounts: [],
      url: ""
    },
    // mumbai: {
    //   chainId: 80001,
    //   url: process.env.Mumbai_RPC_URL,
    //   accounts: [PRIVATE_KEY]
    // }
  },
  namedAccounts: {
    deployer: {
      default: 0,
      1: 1
    }
  }
};
