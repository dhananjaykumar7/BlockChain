//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.15;
contract ExampleMapping2 {

    mapping(address => uint) public balanceReceive; 

    function sendMoney() public payable {
        balanceReceive[msg.sender] +=msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawnAllMoney(address payable _to) public{
        uint balanceToSend = balanceReceive[msg.sender];
        balanceReceive[msg.sender] = 0;
        _to.transfer(balanceToSend);

    }
}