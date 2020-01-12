pragma solidity ^0.5.0;

contract Election {
	
	//Create struct (data type) for storing candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	mapping(address => bool) public voters;

	mapping(uint => Candidate) public candidates;

	//Store candidates count
	uint public candidatesCount;

	event votedEvent (
		uint indexed _candidateId
	);

	//Store Candidate
	//Fetch Candidate

	//Constructor
	constructor() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
		addCandidate("Candidate 3");
	}

	function addCandidate (string memory _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote (uint _candidateId) public {
		//require that they haven't voted before
		require(!voters[msg.sender]);

		//require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		//record the voter has voted
		voters[msg.sender] = true;
		//update candidate vote count
		candidates[_candidateId].voteCount ++;

		//trigger votedEvent
		emit votedEvent(_candidateId);
	}


}