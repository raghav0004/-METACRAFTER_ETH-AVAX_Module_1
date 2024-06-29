
# Metacrafters_ETH+AVAX_Intermediate_Module_01_Submission


## Voting System Smart Contract

The VotingSystem smart contract is a decentralized application designed to manage a proposal-based voting system on the Ethereum blockchain. This contract demonstrates exception handling using `require()`, `assert()`, and `revert()` statements, which are crucial for ensuring robust and secure smart contract functionality.

### Contract Introduction

The VotingSystem smart contract enables the creation of proposals, allows users to vote on these proposals, and provides mechanisms for finalizing the proposals based on the voting results. The contract ensures that only the owner can create and finalize proposals while allowing any address to cast votes. The use of events provides transparency and traceability for proposal creation, voting, and finalization actions.

### Variables and Structs

- **contractOwner**: The address of the contract owner, who has special privileges to create and finalize proposals.
- **totalProposals**: A counter tracking the total number of proposals created.
- **Proposal Struct**: Defines the structure of a proposal, which includes:
  - `proposalId`: Unique identifier for the proposal
  - `proposalDescription`: Text description of the proposal
  - `totalVotes`: Number of votes received
  - `isFinalized`: Boolean indicating if the proposal has been finalized
- **proposalList Mapping**: Stores proposals by their unique ID.
- **hasVoted Mapping**: Tracks whether an address has voted on a particular proposal.

### Events

- **NewProposal**: Emitted when a new proposal is created.
- **VotedOnProposal**: Emitted when an address votes on a proposal.
- **ProposalFinalized**: Emitted when a proposal is finalized, indicating whether it was accepted based on the vote count.

### Modifiers

- **onlyContractOwner**: Ensures that only the owner can execute certain functions, providing a security check.

### Constructor

- **Constructor**
  - Sets the deploying address as the owner of the contract.

### Functions

1. **createNewProposal**
   - Description: Allows the owner to create a new proposal with a given description.
   - Parameters: `string description`
   - Actions:
     - Increment the total proposal count.
     - Store the new proposal in the proposalList mapping.
     - Emit `NewProposal` event.

2. **castVote**
   - Description: Allows any address to vote on an existing proposal.
   - Parameters: `uint proposalId`
   - Actions:
     - Check if the proposal exists.
     - Check if the proposal has been finalized.
     - Check if the address has already voted.
     - Record the vote in the hasVoted mapping.
     - Increment the proposal's totalVotes.
     - Emit `VotedOnProposal` event.

3. **finalizeProposal**
   - Description: Allows the owner to finalize a proposal.
   - Parameters: `uint proposalId`
   - Actions:
     - Check if the proposal exists.
     - Check if the proposal has already been finalized.
     - Mark the proposal as finalized.
     - Emit `ProposalFinalized` event indicating whether the proposal was accepted based on the vote count.
     - Assert that the proposal is marked as finalized.

4. **getProposalDetails**
   - Description: Provides details of a specific proposal.
   - Parameters: `uint proposalId`
   - Returns: `uint proposalId, string proposalDescription, uint totalVotes, bool isFinalized`

5. **changeOwnership**
   - Description: Allows the owner to transfer ownership of the contract to a new address.
   - Parameters: `address newOwner`
   - Actions:
     - Require that the new owner address is not the zero address.
     - Update the contract owner to the new address.

### Deploying the Contract

1. **Setup Environment**
   - Install and set up a development environment such as Truffle or Hardhat.
   - Ensure you have an Ethereum wallet like MetaMask configured.

2. **Compile the Contract**
   - Use the Solidity compiler (solc) to compile the contract, ensuring there are no syntax errors.

3. **Deploy Script**
   - Write a deployment script using web3.js or ethers.js to deploy the contract.
   - Specify the contract's ABI and bytecode.

4. **Deploy**
   - Execute the deployment script using a connected Ethereum account with sufficient gas fees.
   - Deploy the contract to the specified Ethereum network.

5. **Verify Deployment**
   - Verify the contract address.
   - Ensure the contract owner's address is correctly set.

By following these steps, the VotingSystem contract will be live on the Ethereum network, ready to create proposals, accept votes, and finalize decisions based on decentralized voting.
