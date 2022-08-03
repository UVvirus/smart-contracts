contract VulnerableCode {

    mapping(address=>uint256)balances;

    function deposit() public payable
    {
        balances[msg.sender]=msg.value;
    }

    function withdraw(uint256 amount) public
    {
        balances[msg.sender]-= amount;
        msg.sender.transfer(amount);
    }
}

contract ChecksEffectsInteractionpattern{

    mapping(address=>uint256)balances;

    function deposit() public payable{
        balances[msg.sender]=msg.value;
    }
    function withdraw(uint256 amount) public{
        require(balances[msg.sender]>=amount);
        balances[msg.sender]-=amount;
        msg.sender.transfer(amount);
    }
}