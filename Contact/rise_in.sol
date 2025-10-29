
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
