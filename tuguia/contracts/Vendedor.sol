// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorRegistration {
    address public admin;

    struct Vendor {
        string name;
        string serviceType; 
        bool isVerified;
        uint256 idNegocio;
    }

    mapping(address => Vendor) public vendors;

    constructor() {
        admin = msg.sender;  
    }

function registerVendor(address _vendorAddress, string memory _name, string memory _serviceType, uint256 _idNegocio) public {
    require(msg.sender == admin, "Solo el administrador puede registrar vendedores");
    vendors[_vendorAddress] = Vendor(_name, _serviceType, false, _idNegocio);  
}


   
    function verifyVendor(address _vendorAddress) public {
        require(msg.sender == admin, "Solo el administrador puede verificar vendedores");
        Vendor storage vendor = vendors[_vendorAddress];
        require(bytes(vendor.name).length > 0, "El vendedor no esta registrado"); 
        vendor.isVerified = true;  
    }

    
    function isVendorVerified(address _vendorAddress) public view returns (bool) {
        Vendor memory vendor = vendors[_vendorAddress];
        return vendor.isVerified;
    }
}