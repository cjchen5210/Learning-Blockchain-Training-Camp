// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
const network = require("hardhat");

async function main() {
  const Counter = await hre.ethers.getContractFactory("Counter");
  console.log("Deploying the smart contract");
  const counter = await Counter.deploy();
  await counter.deployed();
  const deployers = await hre.ethers.getSigners();
  // console.log(`the deployer is ${deployers[0].address}`);
  // console.log(`the cheater is ${deployers[1].address}`);
  // console.log(network.config);
  console.log(`this is the address of the contract ${counter.address}`);
  // 如果要打印属性，在部署脚本里依然要通过函数的形式调用
  const counterValue = await counter.counter();
  const counterAdd = await counter.add(9);
  // xxx.wait() 函数是为了等待这个函数确定在区块链上执行生效，再继续下面的程序
  await counterAdd.wait(1);
  const currentCounterValue = await counter.counter();
  // const currentCounterValue = counterAdd.counter();
  console.log(`the contract address is ${counter.address}`);
  console.log(`the counter value is ${counterValue}`);
  console.log(`the counter value is ${currentCounterValue}`);
}

const verify = async (contractAddress, args) => {
  console.log("Verifying contract...")
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    })
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already Verified!")
    } else {
      console.log(e)
    }
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
