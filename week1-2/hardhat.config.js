require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL;
// const GOERLI_ETHERSCAN_API_KEY = process.env.GOERLI_ETHERSCAN_API_KEY;
const GOERLI_PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "hardhat",
  networks: {
    localhost: {
      chainId: 31337,
      url: "http://localhost:8545",
    },
    goerli: {
      url: GOERLI_RPC_URL,
      chainId: 5,
      accounts: [GOERLI_PRIVATE_KEY],
    },
    mumbai: {
      url: "",
      chainId: 80001
    },
    sepolia: {
      chainId: 11155111,
      url: ""
    }
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY
  }
};
