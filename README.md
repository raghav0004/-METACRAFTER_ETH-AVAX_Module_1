## Voting Simulation Smart Contract

### Prerequisites
- **Solidity Version:** ^0.8.18
- **Ethereum Development Environment:** Hardhat, Truffle, or Remix

### Contract Explanation

#### State Variables
1. **voteCount:** A mapping that tracks the number of votes each voter has cast.
2. **hasVoted:** A mapping that records whether a voter has already voted.

#### Functions

1. **`vote(string memory voter, uint _age) external`**
   - **Purpose:** Allows a voter to cast their vote.
   - **Steps:**
     1. Verify voter's age using the `ageVerify` function.
     2. Check if the voter has already voted using the `hasVoted` mapping.
     3. If the voter has not voted before and meets the age requirement:
        - Increment the vote count for the voter.
        - Set the voter's status to "voted" in the `hasVoted` mapping.
     4. Ensure the vote count is incremented correctly using `assert`.

2. **`ageVerify(uint _age) public pure`**
   - **Purpose:** Checks if the voter meets the age requirement of 18 years or older.
   - **Steps:**
     1. If the voter's age is less than 18:
        - Revert the transaction with the message: "Voter is not eligible to Vote".
   - **Note:** This function is marked as `pure` since it does not read or modify the state.

### Usage
- Deploy the contract to the Ethereum network using an Ethereum development environment like Remix.
- After deployment, interact with the contract by calling the `vote` function with the voter's identifier and age.

### Error Handling
- **`require:`** Ensures conditions are met before proceeding. If the condition is not met, it reverts the transaction with an error message: "You have already voted".
- **`revert:`** Explicitly reverts the transaction with an error message if a condition is not satisfied: "Voter is not eligible to Vote".
- **`assert:`** Checks for conditions that should never be false. If the condition is false, it indicates a critical error and reverts the transaction to ensure the vote count is valid.

### Example

```plaintext
// Voter attempts to cast a vote
vote("Alice", 20);

// Voter is too young
vote("Bob", 16); // This will revert with "Voter is not eligible to Vote"

// Voter has already voted
vote("Alice", 20); // This will revert with "You have already voted"
