# 🎲 LuckyFlip – A Simple Beginner Ethereum DApp

LuckyFlip is a beginner-friendly Ethereum smart contract game where users can bet ETH and try their luck by guessing **heads or tails**. If the guess is correct, the player wins **2x** their bet. If not, the contract keeps the ETH.

This project is perfect for anyone who is learning Solidity and wants to understand:
- How betting works on-chain
- How to handle ETH payments in smart contracts
- How events and randomness can be used
### Screenshots
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/9719784b-26bc-4953-b780-dcab1cadb4a6" />

Contact link : https://repo.sourcify.dev/11142220/0x648aB62BFC3aC1Fdc08304f0D4387c4153f6cad5/

---

## ✅ What LuckyFlip Does
- Users send ETH to the contract.
- They choose **true = heads** or **false = tails**.
- The contract generates a random result.
- If the guess matches, the user instantly gets double their ETH back.
- All results are stored on-chain using events.

---

## ✨ Features
✔ Simple and beginner-friendly  
✔ Uses ETH as betting currency  
✔ 2x reward for correct guesses  
✔ Owner can withdraw contract balance  
✔ Emits events for transparency  
✔ Works out-of-the-box on Remix

---


## 📜 Smart Contract Code
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyFlip {
    address public owner;

    event Result(address player, uint256 amount, bool guess, bool won);

    constructor() {
        owner = msg.sender;
    }

    // Player sends money and guesses true=heads, false=tails
    function flip(bool _guess) public payable {
        require(msg.value > 0, "You must bet some ETH");

        // Basic pseudo random (NOT FOR REAL BETTING)
        uint256 randomNumber = uint256(
            keccak256(abi.encodePacked(block.timestamp, msg.sender))
        ) % 2;

        bool coinFlip = randomNumber == 1;

        if (coinFlip == _guess) {
            // Player wins 2x amount
            payable(msg.sender).transfer(msg.value * 2);
            emit Result(msg.sender, msg.value, _guess, true);
        } else {
            // Player loses, money remains in contract
            emit Result(msg.sender, msg.value, _guess, false);
        }
    }

    // Owner can withdraw contract balance
    function withdraw(uint256 _amount) public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(_amount);
    }

    // Check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // To receive ETH directly
    receive() external payable {}
}

