//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.15;

contract ExampleMapping {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping (uint => bool)) public uintUintBooleanMapping;

//     function myMapping(uint _key) public view returns(bool){
//              return myMapping[_key];
// }
   
    function setValue(uint _index) public {
        myMapping[_index] = true;

    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUinitBooleanMapping(uint key1,uint key2,bool value) public{
        uintUintBooleanMapping[key1][key2]=value;
    }
}
