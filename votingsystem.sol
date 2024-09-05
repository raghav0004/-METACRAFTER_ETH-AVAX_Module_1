// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract voting_simulation {
    mapping(string => uint) public voteCount;
    mapping(string => bool) public hasVoted;

    function vote(string memory voter, uint _age) external {
        ageVerify(_age);

        require(!hasVoted[voter], "You have already voted");

        voteCount[voter] += 1;
        hasVoted[voter] = true;

        assert(voteCount[voter] > 0);
    }

    function ageVerify(uint _age) public pure {
        if (_age < 18) {
            revert("Voter is not eligible to Vote");
        }
    }
}
