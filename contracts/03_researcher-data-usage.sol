// SPDX-License-Identifier: CC-BY-NC-4.0
// © 2025 Francheska Aguinot (pseudonym: Frankie Aguinot)
// Frankly EMR Proof Folder — Version 1.1
// U.S. Copyright Office Case #1-15046837951
pragma solidity ^0.8.0;

import "./00_actor-role-manager.sol";
import "./01_patient-consent-registry.sol";

/// @title Researcher Data Access Logger
/// @notice Enables researchers to log permitted queries under patient consent

contract ResearcherDataUsage {
    AccessControlFrankly public accessControl;
    ConsentRegistry public consentRegistry;

    event ResearchQueryAccessed(
        address indexed researcher,
        address indexed patient,
        bytes32 indexed queryHash,
        string studyPurpose,
        string metadata,
        uint256 timestamp
    );

    constructor(address _accessControlAddr, address _consentRegistryAddr) {
        accessControl = AccessControlFrankly(_accessControlAddr);
        consentRegistry = ConsentRegistry(_consentRegistryAddr);
    }

    /// @notice Log a research query against a patient's data, if permitted
    /// @param patient The patient whose data is being queried
    /// @param queryHash A hash representing the study scope/query
    /// @param studyPurpose Short human-readable description of research intent
    /// @param metadata Optional pointer to off-chain registry or record
    function queryData(
        address patient,
        bytes32 queryHash,
        string calldata studyPurpose,
        string calldata metadata
    ) external {
        require(
            accessControl.hasRole(patient, msg.sender),
            "Researcher not approved by patient"
        );

        require(
            consentRegistry.isPermitted(patient, msg.sender, queryHash),
            "Consent not granted for this query scope"
        );

        emit ResearchQueryAccessed(
            msg.sender,
            patient,
            queryHash,
            studyPurpose,
            metadata,
            block.timestamp
        );
    }
}
