//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract  TestToken{
    string public name="HardHat Example";
    string public symbol="DECAY";
    uint public totalSupplybalance=10000;

    address public owner;
    mapping(address =>uint) balances;

    constructor(){
        balances[msg.sender] = totalSupplybalance;
        owner = msg.sender;
    }

    function transfer(address _to,uint amount) external{
        require(balances[msg.sender]>=amount,"not enough balance");
        balances[msg.sender]-=amount;
        balances[_to]+=amount;

    }

    function balanceOf(address account) external view returns(uint){
        return balances[account];
    }
}