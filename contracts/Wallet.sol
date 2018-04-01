pragma solidity ^0.4.6;

contract Wallet {
    address public owner;
    address public _walletLibrary;

    function Wallet ( address libAddress, address _owner) public {
        _walletLibrary = libAddress;
        _walletLibrary.delegatecall(bytes4(keccak256("initWallet(address)")), _owner);
    }

    function withdraw(uint amount) public returns (bool success) {
        return _walletLibrary.delegatecall(bytes4(keccak256("withdraw(uint)")), amount);
    }

    function () payable {
        _walletLibrary.delegateCall(msg.data);
    }
}