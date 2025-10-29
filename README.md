# 🎲 LuckyFlip – A Simple Beginner Ethereum DApp

LuckyFlip is a beginner-friendly Ethereum smart contract game where users can bet ETH and try their luck by guessing **heads or tails**. If the guess is correct, the player wins **2x** their bet. If not, the contract keeps the ETH.

This project is perfect for anyone who is learning Solidity and wants to understand:
- How betting works on-chain
- How to handle ETH payments in smart contracts
- How events and randomness can be used

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
//paste your code
