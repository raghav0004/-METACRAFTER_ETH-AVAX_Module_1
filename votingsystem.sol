// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract VotingContract {

    address public contractOwner;
    uint public totalProposals;

    struct Proposal {
        uint proposalId;
        string proposalDescription;
        uint totalVotes;
        bool isFinalized;
    }

    mapping(uint => Proposal) public proposalList;
    mapping(address => mapping(uint => bool)) public hasVoted;

    event NewProposal(uint proposalId, string description);
    event VotedOnProposal(address voter, uint proposalId);
    event ProposalFinalized(uint proposalId, bool passed);

    modifier onlyContractOwner() {
        if (msg.sender != contractOwner) {
            revert("Only the contract owner can perform this action");
        }
        _;
    }

    constructor() {
        contractOwner = msg.sender;
    }

    function createNewProposal(string memory description) public onlyContractOwner {
        totalProposals++;
        proposalList[totalProposals] = Proposal(totalProposals, description, 0, false);
        emit NewProposal(totalProposals, description);
    }

    function castVote(uint proposalId) public {
        Proposal storage currentProposal = proposalList[proposalId];

        if (currentProposal.proposalId == 0) {
            revert("Proposal does not exist");
        }
        if (currentProposal.isFinalized) {
            revert("Proposal is already finalized");
        }
        if (hasVoted[msg.sender][proposalId]) {
            revert("You have already voted on this proposal");
        }

        hasVoted[msg.sender][proposalId] = true;
        currentProposal.totalVotes++;

        emit VotedOnProposal(msg.sender, proposalId);
    }

    function finalizeProposal(uint proposalId) public onlyContractOwner {
        Proposal storage currentProposal = proposalList[proposalId];

        if (currentProposal.proposalId == 0) {
            revert("Proposal does not exist");
        }
        if (currentProposal.isFinalized) {
            revert("Proposal is already finalized");
        }

        currentProposal.isFinalized = true;

        bool isAccepted = currentProposal.totalVotes > 0;
        emit ProposalFinalized(proposalId, isAccepted);

        assert(currentProposal.isFinalized == true);
    }

    function getProposalDetails(uint proposalId) public view returns (uint, string memory, uint, bool) {
        Proposal storage currentProposal = proposalList[proposalId];
        return (currentProposal.proposalId, currentProposal.proposalDescription, currentProposal.totalVotes, currentProposal.isFinalized);
    }

    function changeOwnership(address newOwner) public onlyContractOwner {
        require(newOwner != address(0), "New owner address cannot be zero address");
        contractOwner = newOwner;
    }
}
