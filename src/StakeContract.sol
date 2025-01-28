// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakeContract { 
    mapping (address => uint) balances;
    mapping (address => uint) unclaimedRewards;
    mapping (address => uint) lastUpdateTime;

    constructor () {

    }

    function stake() public payable {
        require(msg.value > 0);
        
        if (!lastUpdateTime[msg.sender]) {
            lastUpdateTime[msg.sender] = block.timestamp;
        } else {
            unclaimedRewards[msg.sender] += (block.timestamp - 
                lastUpdateTime[msg.sender]) * balances[msg.sender] * 1e3;
            lastUpdateTime[msg.sender] = block.timestamp;
        }

        balances[msg.sender] += msg.value;
    }

    function unStake(uint _amount) public {
        uint totalBalance = balances[msg.sender];
        require(totalBalance >= _amount);

        unclaimedRewards[msg.sender] += (block.timestamp - 
            lastUpdateTime[msg.sender]) * balances[msg.sender] * 1e3;
        lastUpdateTime[msg.sender] = block.timestamp;

        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;

    }

    function claimRewards() public {
        uint reward_rate = 1e3 ;
        uint currentReward = unclaimedRewards[msg.sender];
        uint updateTime = lastUpdateTime[msg.sender];
        uint newReward = (block.timestamp - updateTime) * balances[msg.sender] * reward_rate;
        
        // transfer currentReward + newReward;
        
        unclaimedRewards[msg.sender] = 0;
        lastUpdateTime[msg.sender] = block.timestamp;
    }

    function getRewards(address _address) public view returns(uint) {
        uint reward_rate = 1e3 ;
        uint currentReward = unclaimedRewards[_address];
        uint updateTime = lastUpdateTime[_address];
        uint newReward = (block.timestamp - updateTime) * balances[_address] * reward_rate;
        uint totalReward = currentReward + newReward;
        return totalReward;
    }

    function balanceOf(address _address) public view returns (uint) {
        return balances[_address];
    }
}