pragma solidity 0.8.0;

contract ERC20Token {

    string public name="UV_TOKEN";
    string public symbol = "UV";
    uint256 public totalsupply;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address  => uint256)public balanceof;
    mapping(address => mapping(address=>uint256))public allowance;

    function initialSupply(uint256 supply)public{
        balanceof[msg.sender]= supply;
        totalsupply=supply;

    }

    function approve(address spender, uint256 value)public returns (bool success){

        require(spender != address(0));
        allowance[msg.sender][spender]= value;
        emit Approval(msg.sender,spender,value);
        return true;



    }

    function transfer(address to, uint256 value) public returns (bool success){
        /** Enough token check **/
        require(balanceof[msg.sender]>= value);

        balanceof[msg.sender]-= value;
        balanceof[to]+=value;
        Transfer(msg.sender,to,value);
        return true;

    }

}
