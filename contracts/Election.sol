pragma solidity ^0.5.0;

contract Election {
	//Store Candidate
	//Read Candidate
	string public candidate;
	//Constructor
	constructor() public {
		candidate = "Candidate 1";
	}
}