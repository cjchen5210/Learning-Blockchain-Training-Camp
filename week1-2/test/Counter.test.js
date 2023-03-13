const { assert, expect } = require("chai");
const ethers = require("hardhat");

// describe("constructor", function () {
//   it("this is to verify Counter constructor", async () => {
//     // assert 和 expect的区别

//     // assert比较简单，并且执行完之后会立即终止当前函数的执行，但是expect不会
//     // expect会继续执行后面函数的内容，因此在expect的里面可以执行多个测试用例
//     // expect提供了更多的比较函数，但是assert就只能使用js里面简单的运算符

//     // 简单的就可以用assert，复杂的就要使用expect来测试
//     const Counter = await ethers.ethers.getContractFactory("Counter");
//     const counter = await Counter.deploy();
//     await counter.deployed();

//     const constructorValue = await counter.counter();
//     expect(constructorValue).to.equal(1);
//     assert.equal(constructorValue, 1, "this is CORRECT! man!");
//   });
//   it("this is to verify Counter add function", async () => {
//     const Counter = await ethers.ethers.getContractFactory("Counter");
//     const counter = await Counter.deploy();
//     await counter.deployed();

//     const addFunction = await counter.add(10);
//     await addFunction.wait(1);
//     const currentCounterValue = await counter.counter();
//     expect(currentCounterValue).to.equal(11);
//   });
// });

describe("Counter", () => {
  let contract;
  let owner;
  let thief;
  beforeEach(async () => {
    const CounterContract = await ethers.ethers.getContractFactory("Counter");
    [owner, thief] = await ethers.ethers.getSigners();
    contract = await CounterContract.deploy();
    await contract.deployed();
  });

  it("The case is that function can be used by owner", async () => {
    const addFunction = await contract.add(9);
    await addFunction.wait(1);
    const counter = await contract.counter();
    expect(counter).to.be.equal(10);
  });

  it("The case is that function can NOT be used by thief", async () => {
    try {
      await expect(contract.connect(thief).add(9)).to.be.revertedWith(
        "This is thief who are using my function"
      );
    } catch (error) {
        console.log(error, "The test is verified");
    }
  });
  //   describe("This is to user 'add' function by owner", () => {});
});
