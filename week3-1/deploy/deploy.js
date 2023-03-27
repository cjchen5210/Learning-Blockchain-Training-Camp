const { network } = require("hardhat");
module.exports = async ({getNamedAccounts, deployments}) => {
    const {deploy, log} = deployments;
    const {deployer} = await getNamedAccounts();
    // todo add if to check chainID if goerli or not
    const chainId = network.config.chainId;

    log("Deploying FundMe and waiting for confirmations...");
    const Vault = await deploy("Vault", {
        from: deployer,
        args: [],
        waitConfirmations: network.config.blockConfirmations || 1,
    });
    log(`FundMe deployed at ${Vault.address}`);
}

// module.exports.tags = ["all"];