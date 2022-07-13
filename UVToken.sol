pragma solidity 0.8.9;

//import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
library SafeMath { // Only relevant functions
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
    }
    function add(uint256 a, uint256 b) internal pure returns (uint256)   {
    uint256 c = a + b;
    assert(c >= a);
    return c;
    }
}

contract UVtoken{
    mapping(address=>uint256)balanceOfUsers;
    mapping(address=>uint256)allowedTokens;
    uint256 totalsupply;



    using SafeMath for uint256;

    constructor(uint256 total) {
        totalsupply=total;
        balanceOfUsers[msg.sender]=totalsupply;

    }
    function TotalSupply() public view returns (uint256){
        return totalsupply;
    }

    function balance_of_users() public view returns (uint256){
        return balanceOfUsers[msg.sender];
    }
    function balance_of_owner(address owner) public view returns (uint256){
        return balanceOfUsers[owner];

    }
    function TransferTokens(address to, uint256 tokens) public {
        balanceOfUsers[msg.sender] = balanceOfUsers[msg.sender].sub(tokens);
        balanceOfUsers[to] = balanceOfUsers[to].add(tokens);
        balanceOfUsers[buyer] = balanceOfUsers[buyer].add(tokens);
        balanceOfUsers[owner] = balanceOfUsers[owner].sub(tokens);


    }

    receive () external payable{}

    function deposit() public payable {
        require(msg.value == 1 ether);
        TransferTokens(msg.sender,1);

    }
}
