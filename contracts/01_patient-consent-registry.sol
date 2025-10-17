// SPDX-License-Identifier: CC-BY-NC-4.0
pragma solidity ^0.8.0;

/// @title PatientConsentRegistry
/// @notice Tracks and manages consent granted by patients for data access

contract PatientConsentRegistry {
    enum ConsentState { NONE, GRANTED, REVOKED }

    struct Consent {
        ConsentState state;
        uint256 timestamp;        // Last change time
        address granter;          // Patient
        address grantee;          // Actor (provider, researcher, etc.)
        bytes32 dataScopeHash;    // Hashed descriptor of fields, time, purpose
        uint256 version;          // Version number
        string metadata;          // Optional URL or JSON pointer
    }

    // Maps: patient => (grantee => Consent)
    mapping(address => mapping(address => Consent)) public consents;

    // Events for transparency
    event ConsentGranted(address indexed patient, address indexed grantee, bytes32 scopeHash, uint256 version);
    event ConsentRevoked(address indexed patient, address indexed grantee, uint256 version);

    /// @notice Grant or update consent
    /// @param grantee Who’s being granted access
    /// @param scopeHash What kind of data/purpose/timeline
    /// @param metadata Optional pointer to off-chain details
    function grantConsent(address grantee, bytes32 scopeHash, string calldata metadata) external {
        Consent storage c = consents[msg.sender][grantee];
        uint256 newVer = c.version + 1;

        c.state = ConsentState.GRANTED;
        c.timestamp = block.timestamp;
        c.granter = msg.sender;
        c.grantee = grantee;
        c.dataScopeHash = scopeHash;
        c.version = newVer;
        c.metadata = metadata;

        emit ConsentGranted(msg.sender, grantee, scopeHash, newVer);
    }

    /// @notice Revoke existing consent
    function revokeConsent(address grantee) external {
        Consent storage c = consents[msg.sender][grantee];
        require(c.state == ConsentState.GRANTED, "No active consent to revoke");
        uint256 newVer = c.version + 1;

        c.state = ConsentState.REVOKED;
        c.timestamp = block.timestamp;
        c.version = newVer;

        emit ConsentRevoked(msg.sender, grantee, newVer);
    }

    /// @notice View a specific consent relationship
    function getConsent(address patient, address grantee) external view returns (Consent memory) {
        return consents[patient][grantee];
    }

    /// @notice Check if a grantee has valid access
    function isPermitted(address patient, address grantee, bytes32 requiredScope) external view returns (bool) {
        Consent storage c = consents[patient][grantee];
        return (c.state == ConsentState.GRANTED && c.dataScopeHash == requiredScope);
    }
}
