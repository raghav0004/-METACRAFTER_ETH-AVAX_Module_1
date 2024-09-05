
# Metacrafters_ETH+AVAX_Intermediate_Module_01_Submission


## Voting System Smart Contract

This smart contract implements a simple voting simulation on the Ethereum blockchain using Solidity. The contract allows users to cast their votes, ensuring they meet the age requirement and have not already voted.

Prerequisites
Solidity version ^0.8.18.
An Ethereum development environment such as Hardhat, Truffle, or Remix.
Contract Explanation
State Variables
The voteCount mapping tracks the number of votes each voter has cast, while the hasVoted mapping keeps a record of whether a voter has already voted or not.

Functions
vote(string memory voter, uint _age) external
This function allows a voter to cast their vote. It first verifies the age of the voter using the ageVerify function. Then, it checks if the voter has already voted using the hasVoted mapping. If the voter has not voted before and meets the age requirement, the function increments the vote count for the voter and sets the voter's status to "voted" in the hasVoted mapping. Finally, it uses an assertion to ensure the vote count is incremented correctly.

ageVerify(uint _age) public pure
This function checks if the voter meets the age requirement of 18 years or older. If the voter's age is less than 18, the function reverts with the message "Voter is not eligible to Vote". This function is marked as pure since it does not read or modify the state.

Usage
Deploy the contract to the Ethereum network using an Ethereum development environment like Remix. After deployment, you can interact with the contract by calling the vote function with the voter's identifier and age.

Error handling
The contract uses require, revert, and assert statements to handle errors and validate conditions throughout the voting process.

Function with error handling
The vote function handles errors by calling the ageVerify function to ensure the voter meets the age requirement. It then checks if the voter has already voted using require and ensures the vote count is incremented correctly with assert. The ageVerify function verifies the age of the voter and reverts the transaction if the voter is under 18.

Error handling statements
require: Ensures conditions are met before proceeding. If the condition is not met, it reverts the transaction with an error message: "You have already voted".
revert: Explicitly reverts the transaction with an error message if a condition is not satisfied: "Voter is not eligible to Vote".
assert: Checks for conditions that should never be false. If the condition is false, it indicates a critical error and reverts the transaction to ensure the vote count is valid.
Author
Raghav Gupta
