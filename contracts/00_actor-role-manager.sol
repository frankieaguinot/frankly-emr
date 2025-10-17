// SPDX-License-Identifier: CC-BY-NC-4.0
pragma solidity ^0.8.0;

/// @title ActorRoleManager
/// @notice Assigns and verifies roles (e.g., Physician, Researcher, Admin) in the Frankly EMR system

contract ActorRoleManager {
    enum Role { NONE, PHYSICIAN, RESEARCHER, ADMIN, AUDITOR }

    mapping(address => Role) public roles;
    address public owner;

    event RoleGranted(address indexed actor, Role role);
    event RoleRevoked(address indexed actor, Role role);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function grantRole(address actor, Role role) external onlyOwner {
        require(role != Role.NONE, "Invalid role");
        roles[actor] = role;
        emit RoleGranted(actor, role);
    }

    function revokeRole(address actor) external onlyOwner {
        emit RoleRevoked(actor, roles[actor]);
        roles[actor] = Role.NONE;
    }

    function hasRole(address actor, Role expectedRole) external view returns (bool) {
        return roles[actor] == expectedRole;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
