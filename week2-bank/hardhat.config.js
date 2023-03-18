require("@nomicfoundation/hardhat-toolbox");
require("hardhat-deploy");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL;
const PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;


module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "hardhat",
  networks: {
    goerli: {
      chainId: 5,
      url: GOERLI_RPC_URL, // RPC -> URL
      accounts: [PRIVATE_KEY]
    },
    mumbai: {
      chainId: 80001,
      url: process.env.Mumbai_RPC_URL,
      accounts: [PRIVATE_KEY]
    },
    hardhat: {
      chainId: 31337,
      // url: "http://localhost:8545",
    }
  },
  etherscan: {
    apiKey: ""
  },
  namedAccounts: {
    deployer: {
      default: 0,
      1: 1
    }
  }
};
