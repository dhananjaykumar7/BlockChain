//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.15;

contract MappingStructExample{

    struct Transaction {
        uint amount;
        uint timesatamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposites;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) balances;

    function depositeMoney() public payable {
        balances[msg.sender].totalBalance +=msg.value;
        Transaction memory deposit = Transaction(msg.value,block.timestamp);

        balances[msg.sender].deposits[balances[msg.sender].numDeposites] = deposit;
        balances[msg.sender].numDeposites++;

    }

    function withdrawMoney(address payable _to,uint _amount) public {
        balances[msg.sender].totalBalance -= _amount;
        Transaction memory withdrawal = Transaction(_amount,block.timestamp);

        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;

        balances[msg.sender].numWithdrawals++;
        _to.transfer(_amount);
    }
}