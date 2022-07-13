pragma solidity 0.8.9;

contract Selfdestruct{
 
         //address anothercontract = 0xd9145CCE52D386f254917e481eB44e9943F39138;
    
    mapping(address => uint256) balances;

    function deposit() public payable{
        balances[msg.sender] = msg.value;


    }

    function balanceof(address account)public returns (bool){
        return address(this).balance;
        
    }

    function selfDestruct(address _anothercontract)public {
        //_anothercontract = anothercontract;
        selfdestruct(payable(_anothercontract));


    }
}
