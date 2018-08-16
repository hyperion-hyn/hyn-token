var Hyperion = artifacts.require("Hyperion");
var HyperionAirdrop = artifacts.require("HyperionAirdrop");

module.exports = function(deployer, network, accounts) {
    owner = accounts[0];
    allocator = accounts[1];

    deployer.deploy(Hyperion, {from: owner}).then(function () {
        deployer.deploy(HyperionAirdrop, Hyperion.address, {from: allocator});
    });
};
