pragma solidity 0.8.9;

contract first_come_first_win{

    function winning_condition(uint256 amount) public payable{
       uint256 reach_this_amount=7 ether;
       amount=msg.value;

       require(msg.value==0.01 ether,"only 0.01 allowed");

       require(msg.value==reach_this_amount,"not a winner");
       address winner=msg.sender;


    }

    function claimReward() public {
        require(msg.sender==winner,"Not a winner")
        (bool succes, )= msg.sender.call{value:address(this).balance}("")
    }
}
