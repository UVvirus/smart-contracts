pragma solidity ^0.4.22;

contract Faucet is mortal{
    address owner;

    event Withdrawl(address indexed to, uint256 amount);
    event Deposit(address indexed from, uint256 amount);
    constructor() {

        owner=msg.sender;
    }

    function withdraw(uint256 amount) public 
    {
        require(amount<=0.1 ether);
        msg.sender.transfer(amount);
        emit Withdrawl(msg.sender, amount);

    }

    function() payable public
    {
        emit Deposit(msg.sender,msg.value);
    }

    // function destroy() public onlyOwner
    // {
    //     require(msg.sender==owner,"not an owner");
    //     selfdestruct(owner);
    // }

    modifier onlyOwner
    {
        require(msg.sender==owner);
        _;
    }
}


contract Owned{
    address owner;

    constructor()
    {
        owner=msg.sender;
    }

    modifier onlyOwner 
    {
        require(msg.sender==owner);
        _;
    }
    
}


contract mortal is Owned{

    function destroy() public onlyOwner
    {
        selfdestruct(owner);
    }
}