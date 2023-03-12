# Learning-Blockchain-Training-Camp
This repository is created specifically to aid teaching assistants in the task of grading assignments. 
## Week 1 class 1 in folder -> week1-1
### 安装Metamask，创建账号

### 执行一次转账
This is my transaction Hash: 
0x644db7091ca24c7e51857c48866aa604f2699ec240490c0e8690fc581cae2c4f
I sent 0.02 eth (Goerli Testnet) from my account to my another account.
<img width="680" alt="image" src="https://user-images.githubusercontent.com/56478943/223639156-c9aa43e0-1f22-4456-b0bb-96e706d18389.png">

### 使用Remix创建一个合约
week1-1 -> Counter.sol

## Week 1 class 2
### 手动版本
### 修改Counter合约，仅有部署者可以调用count()
<img width="945" alt="image" src="https://user-images.githubusercontent.com/56478943/224551549-92156fb4-6942-4359-a572-baf45db03004.png">

### 使用hardhat部署修改后的Counter
contract -> Counter.sol
### 使用hardhat测试Counter
第一个goerli部署的合约地址： 0x5Eb5A82ee6aF12b8C0987EE2F91f819c26815E6c
Successfully!
<img width="1210" alt="image" src="https://user-images.githubusercontent.com/56478943/224551409-317c9c01-a272-4820-95d9-b2b263d28b7f.png">

#### 部署者调用成功
#### 其他地址调用失败
<img width="901" alt="image" src="https://user-images.githubusercontent.com/56478943/224551467-4bf0c499-4b2b-4c40-9be6-b9a493b83c5d.png">


### 自动版本
在deploy文件夹下
