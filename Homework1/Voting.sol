// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting {
    mapping (string => uint256) private voteMap; // Mapping from candidate names to vote counts

    string[] private volunteers; 

    constructor ()  {
        voteMap["Alice"] = 0;
        voteMap["Bob"] = 0;
        voteMap["Charlie"] = 0;
        voteMap["Cool"] = 0;

        volunteers.push("Alice");
        
        volunteers.push("Bob");
        
        volunteers.push("Charlie");
        
        volunteers.push("Cool");

    }

    function vote(string memory name, uint256 number) public {
        voteMap[name] += number;
    }

    function getVotes(string memory name) public view returns (uint256){
        return voteMap[name];
    }

    function resetVotes()  public {
        for (uint256 i = 0; i < volunteers.length; i++) 
        {
            voteMap[volunteers[i]] = 0;
        }
    }

    
}
