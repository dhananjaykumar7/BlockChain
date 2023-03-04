//SPDX-License-Identifier: Unlicensed
pragma solidity >=0.7.0;
contract eventTest{
    event logMessage(address indexed _from,string message);

    function test() public{
        emit logMessage(msg.sender, "Event Test");
    }
}