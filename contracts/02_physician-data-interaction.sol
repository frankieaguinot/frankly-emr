// SPDX-License-Identifier: CC-BY-NC-4.0
pragma solidity ^0.8.0;

import "./00_actor-role-manager.sol";
import "./01_patient-consent-registry.sol";

/// @title Physician Data Interaction Logger
/// @notice Allows physicians to interact with patient records only if consent is valid

contract PhysicianDataInteraction {
    AccessControlFrankly public accessControl;
    ConsentRegistry public consentRegistry;

    event DataAccessed(
        address indexed physician,
        address indexed patient,
        bytes32 indexed dataCategoryHash,
        string purpose,
        string metadata,
        uint256 timestamp
    );

    constructor(address _accessControlAddr, address _consentRegistryAddr) {
        accessControl = AccessControlFrankly(_accessControlAddr);
        consentRegistry = ConsentRegistry(_consentRegistryAddr);
    }

    /// @notice Log an interaction with a patient’s data if permitted
    /// @param patient The patient whose data is being accessed
    /// @param dataCategoryHash Hash of data category (e.g., "labs-Q1-2023")
    /// @param purpose Human-readable string describing the access reason
    /// @param metadata Optional off-chain pointer (e.g., IPFS hash or URL)
    function accessPatientData(
        address patient,
        bytes32 dataCategoryHash,
        string calldata purpose,
        string calldata metadata
    ) external {
        require(
            accessControl.hasRole(patient, msg.sender),
            "Physician not approved by patient"
        );

        require(
            consentRegistry.isPermitted(patient, msg.sender, dataCategoryHash),
            "Consent not granted for this data scope"
        );

        emit DataAccessed(
            msg.sender,
            patient,
            dataCategoryHash,
            purpose,
            metadata,
            block.timestamp
        );
    }
}
