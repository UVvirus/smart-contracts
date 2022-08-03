
contract Reentrancy{

    uint256 withdrawalLimit=1 ether;
    mapping(address=>uint256) public lastwithdrawtime;
    mapping(address=>uint256)public balances;

    function deposit() public payable
    {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public
    {
        require(balances[msg.sender]>=amount);
        require(balances[msg.sender]<= withdrawalLimit);
        require(msg.sender.call.{value(0.5 ether)}(""));
    }
}