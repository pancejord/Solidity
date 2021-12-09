var file = artifacts.require("./file.sol");

module.exports = function(deployer) {
    deployer.deploy(file);
}