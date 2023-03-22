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
<img width="901" alt="image" src="https://user-images.githubusercontent.com/56478943/224716633-31e0d9ae-0324-4872-a35e-e72bcab14e67.png">



### 自动版本
在deploy文件夹下

## Week2 Bank Contract
编写，部署合约到测试网，合约功能为存款，取款。<br>
前端使用ethers <br>
通过vercel部署前端，地址 -> https://my-bank-website.vercel.app/
### 合约地址
合约地址 -> https://goerli.etherscan.io/address/0xe86cc5f5f90300d4b93cf8e06239a45f3a327bb6
![image](https://user-images.githubusercontent.com/56478943/226849136-b08e41e2-b45c-4aef-8990-f435c15bd967.png)

### code repo
合约 -> https://github.com/cjchen5210/Learning-Blockchain-Training-Camp/tree/main/week2-bank
<br>前端 -> https://github.com/cjchen5210/my-bank-website
### 页面截图
![image](https://user-images.githubusercontent.com/56478943/226847982-c12a918a-470d-4238-8624-d625005e1b2d.png)

### 链接钱包
![image](https://user-images.githubusercontent.com/56478943/226849598-e5cbe120-34d8-4b89-b683-064fe4531b0c.png)

### 通过MetaMask向Bank转账ETH
![image](https://user-images.githubusercontent.com/56478943/226849862-14bdfd88-518f-4d6f-a23a-2e16b563e7c1.png)
![image](https://user-images.githubusercontent.com/56478943/226850291-cd784ecc-58bf-4c10-95e4-342def9be2b6.png)
![image](https://user-images.githubusercontent.com/56478943/226850359-87949f7a-af32-4bbf-9f35-f4d615a8d308.png)

### Bank合约记录每个地址转账金额
![image](https://user-images.githubusercontent.com/56478943/226850399-e9a95768-242d-4a92-8a47-c5b1dd1df978.png)

### 编写withdraw，取出ETH
![image](https://user-images.githubusercontent.com/56478943/226850475-d1ef519f-f8ca-4a2a-964b-44ed32f59c0a.png)
![image](https://user-images.githubusercontent.com/56478943/226850779-1712d7b6-a605-48b2-b3e1-fb336cb6518f.png)
![image](https://user-images.githubusercontent.com/56478943/226850879-4f69fb44-c4f9-4aa6-86d6-d7444f3ddba0.png)

## week2 Score & Teacher
the code is in repo -> week2-2
