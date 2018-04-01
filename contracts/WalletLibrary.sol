pragma solidity ^0.4.6;

contract WalletLibrary {
    address owner;

    function initWallet(address _owner) {
        owner = _owner;
    }

    function changeOwner(address _newOner) external {
        if (msg.sender == owner) {
            owner = _newOwner;
        }
    }

    function () payable {}

    function withdraw(uint amount) external returns (bool success) {
        if(msg.sender == owner){
            return owner.send(amount);
        } else {
            return false;
        }
    }
}