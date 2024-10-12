// javascript
const VendorRegistration = artifacts.require("VendorRegistration");

module.exports = function (deployer) {
    deployer.deploy(VendorRegistration);
};