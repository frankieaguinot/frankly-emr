// SPDX-License-Identifier: CC-BY-NC-4.0
pragma solidity ^0.8.0;

import "./00_actor-role-manager.sol";
import "./01_patient-consent-registry.sol";

/// @title Government Oversight Logger
/// @notice Allows government entities to log permitted oversight access

contract GovernmentOversight {
    AccessControlFrankly public accessControl;
    ConsentRegistry public consentRegistry;

    event OversightAccessed(
        address indexed agency,
        address indexed patient,
        bytes32 indexed oversightScopeHash,
        string justification,
        string metadata,
        uint256 timestamp
    );

    constructor(address _accessControlAddr, address _consentRegistryAddr) {
        accessControl = AccessControlFrankly(_accessControlAddr);
        consentRegistry = ConsentRegistry(_accessControlAddr);
    }

    /// @notice Log an oversight interaction with a patient record, if permitted
    /// @param patient The patient whose data is being accessed
    /// @param oversightScopeHash A hash representing the scope of oversight
    /// @param justification Short human-readable reason (e.g., "mandatory reporting")
    /// @param metadata Optional pointer to legal or procedural records
    function logOversightAccess(
        address patient,
        bytes32 oversightScopeHash,
        string calldata justification,
        string calldata metadata
    ) external {
        require(
            accessControl.hasRole(patient, msg.sender),
            "Agency not approved by patient"
        );

        require(
            consentRegistry.isPermitted(patient, msg.sender, oversightScopeHash),
            "Consent not granted for this oversight scope"
        );

        emit OversightAccessed(
            msg.sender,
            patient,
            oversightScopeHash,
            justification,
            metadata,
            block.timestamp
        );
    }
}
