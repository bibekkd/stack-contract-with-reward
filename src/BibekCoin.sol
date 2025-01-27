// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BibekCoin is ERC20 { 
    address stakingContract;
    address owner;
    
    constructor(address _stakingAddress) ERC20("BibekCoin", "BIB") {
        stakingContract = _stakingAddress;
        owner = msg.sender;
    }

    function updateStakingContract(address _stakingContract) public {
        require(msg.sender == owner);
        stakingContract = _stakingContract;
    }

    function mint(address _to, uint _value) public {
        require(msg.sender == stakingContract);
        _mint(_to, _value);
    }

}