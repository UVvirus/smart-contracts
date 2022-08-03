import "faucet.sol";

contract Token is mortal{
    Faucet faucet;

    constructor()
    {
        faucet=new Faucet();       
    }
}
