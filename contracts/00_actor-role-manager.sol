// SPDX-License-Identifier: CC-BY-NC-4.0
pragma solidity ^0.8.0;

/// @title AccessControl for Frankly EMR
/// @notice Manages role-based access and consent permissions in a trustless environment.

contract AccessControlFrankly {
    address public owner;

    mapping(address => bool) private patients;
    mapping(address => bool) private providers;
    mapping(address => mapping(address => bool)) private accessPermissions;

    event PatientRegistered(address indexed patient);
    event ProviderRegistered(address indexed provider);
    event AccessGranted(address indexed patient, address indexed provider);
    event AccessRevoked(address indexed patient, address indexed provider);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    modifier onlyPatient() {
        require(patients[msg.sender], "Not a registered patient");
        _;
    }

    modifier onlyProvider() {
        require(providers[msg.sender], "Not a registered provider");
        _;
    }

    function registerPatient(address _patient) public onlyOwner {
        patients[_patient] = true;
        emit PatientRegistered(_patient);
    }

    function registerProvider(address _provider) public onlyOwner {
        providers[_provider] = true;
        emit ProviderRegistered(_provider);
    }

    function grantAccess(address _provider) public onlyPatient {
        require(providers[_provider], "Provider not registered");
        accessPermissions[msg.sender][_provider] = true;
        emit AccessGranted(msg.sender, _provider);
    }

    function revokeAccess(address _provider) public onlyPatient {
        accessPermissions[msg.sender][_provider] = false;
        emit AccessRevoked(msg.sender, _provider);
    }

    function hasAccess(address _patient, address _provider) public view returns (bool) {
        return accessPermissions[_patient][_provider];
    }
}
