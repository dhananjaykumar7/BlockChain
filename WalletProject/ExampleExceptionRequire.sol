//SPDX-License-Identifier: Unlicensed
pragma solidity 0.7.0;

contract ExampleExceptionRequire {

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable{
        balanceReceived[msg.sender] +=msg.value;
    }

    function withdrawMoney(address payable _to,uint _amount) public{
        // if(_amount <= balanceReceived[msg.sender]){
        //     balanceReceived[msg.sender] -=_amount;
        //     _to.transfer(_amount);
        // }

         require(_amount <= balanceReceived[msg.sender],"Not enough funds, aborting!");
            balanceReceived[msg.sender] -=_amount;
            _to.transfer(_amount);
        
    }
}