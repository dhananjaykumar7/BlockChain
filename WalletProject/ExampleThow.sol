//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.15;

contract ExampleThrow {
  error NotAllowedError(string);
    function aFunction() public pure {
        //require(false,"Error message")
        //assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract HandleError {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);
    function catchError() public {
        ExampleThrow et = new ExampleThrow();

        try et.aFunction(){
            // add code here if it works
        }
        catch Error(string memory reason){
            emit ErrorLogging(reason);
        }
        catch Panic(uint errorCode){
            emit ErrorLogCode(errorCode);

        }
        catch(bytes memory lowLevelData){
            emit ErrorLogBytes(lowLevelData);
        }
    }
}