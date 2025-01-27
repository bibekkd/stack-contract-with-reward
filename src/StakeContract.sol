// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakeContract { 
    mapping (address => uint) balances;
    uint public totalStacked;

    constructor () {

    }

    function stake(uint _amount) public payable {
        require(_amount > 0);
        require(msg.value == _amount);
        totalStacked += _amount;
        balances[msg.sender] += _amount;
    }

    function unStake(uint _amount) public {
        uint totalBalance = balances[msg.sender];
        require(totalBalance >= _amount);
        totalStacked -= _amount;
        balances[msg.sender] -= _amount;
    }

    function claimReward() public {

    }

    function getReward() public {
        
    }
}