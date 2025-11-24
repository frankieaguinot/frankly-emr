// SPDX-License-Identifier: CC-BY-NC-4.0
// © 2025 Frankie Aguinot, MD. All rights reserved.
pragma solidity ^0.8.0;

/// @title PatientConsentRegistry
/// @notice Handles patient-controlled data access permissions within Frankly EMR

contract PatientConsentRegistry {
    enum ConsentState { NONE, GRANTED, REVOKED }

    struct Consent {
        ConsentState state;
        uint256 timestamp;
        bytes32 dataScopeHash;
        uint256 version;
        string metadata;
    }

    mapping(address => bool) public registeredPatients;
    mapping(address => bool) public registeredProviders;
    mapping(address => mapping(address => Consent)) public consents;

    address public owner;

    event PatientRegistered(address indexed patient);
    event ProviderRegistered(address indexed provider);
    event ConsentGranted(address indexed patient, address indexed provider, bytes32 scopeHash, uint256 version);
    event ConsentRevoked(address indexed patient, address indexed provider, uint256 version);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    modifier onlyPatient() {
        require(registeredPatients[msg.sender], "Not a registered patient");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerPatient(address _patient) external onlyOwner {
        registeredPatients[_patient] = true;
        emit PatientRegistered(_patient);
    }

    function registerProvider(address _provider) external onlyOwner {
        registeredProviders[_provider] = true;
        emit ProviderRegistered(_provider);
    }

    function grantConsent(address provider, bytes32 scopeHash, string calldata metadata) external onlyPatient {
        require(registeredProviders[provider], "Provider not registered");

        Consent storage c = consents[msg.sender][provider];
        c.state = ConsentState.GRANTED;
        c.timestamp = block.timestamp;
        c.dataScopeHash = scopeHash;
        c.version += 1;
        c.metadata = metadata;

        emit ConsentGranted(msg.sender, provider, scopeHash, c.version);
    }

    function revokeConsent(address provider) external onlyPatient {
        Consent storage c = consents[msg.sender][provider];
        require(c.state == ConsentState.GRANTED, "No active consent to revoke");

        c.state = ConsentState.REVOKED;
        c.timestamp = block.timestamp;
        c.version += 1;

        emit ConsentRevoked(msg.sender, provider, c.version);
    }

    function hasAccess(address patient, address provider, bytes32 requiredScope) public view returns (bool) {
        Consent storage c = consents[patient][provider];
        return (
            registeredPatients[patient] &&
            registeredProviders[provider] &&
            c.state == ConsentState.GRANTED &&
            c.dataScopeHash == requiredScope
        );
    }
}
