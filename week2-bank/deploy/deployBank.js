const { network } = require("hardhat");
module.exports = async ({getNamedAccounts, deployments}) => {
    const {deploy, log} = deployments;
    const {deployer} = await getNamedAccounts();
    const chainId = network.config.chainId;

    log("Deploying FundMe and waiting for confirmations...");
    const bank = await deploy("Bank", {
        from: deployer,
        args: [],
        waitConfirmations: network.config.blockConfirmations || 1,
    });
    log(`FundMe deployed at ${bank.address}`);
}

module.exports.tags = ["all", "bank"];