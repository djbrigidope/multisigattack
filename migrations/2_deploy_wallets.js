const WalletLibrary = artifacts.require("./WalletLibrary.sol");
const Wallet = artifacts.require("./Wallet.sol");

module.exports = function(deployer, network, accounts){
    deployer
        .deployer(WalletLibrary)
        .then(()=>
            deployer.deploy(Wallet, WalletLibrary.address, accounts[0])
        );
};