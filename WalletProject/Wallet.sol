//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.15;

contract Wallet {

    PaymentRecived public payment;

    function payContract () public payable {
        payment = new PaymentRecived(msg.sender,msg.value);
    }
  
}

contract PaymentRecived{

    address public from;
    uint public amount;

    constructor(address _from,uint _amount){
        from = _from;
        amount = _amount;
    }

}

contract wallet2{
     struct PaymentRecivedStruct{
         address from;
         uint amount;
     }
    PaymentRecivedStruct public payment;
     function paymentContract() public payable {
        payment = PaymentRecivedStruct(msg.sender,msg.value);

        //payment.amount = msg.value;
        //payment.from = msg.sender;

     }
}