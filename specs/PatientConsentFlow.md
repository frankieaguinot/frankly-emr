# PatientConsentFlow.md

## Purpose
Ensure patients retain full control over their data — able to view, share, and revoke access on their terms. Patient agency is the backbone of the Frankly EMR.

## Key Concepts
- **Immutable audit trail**: Every access request and data interaction is logged via hash.
- **Smart contract-based consent**: Sharing permissions are programmable, revocable, and time-bound.
- **Decentralized identity**: Patient holds the private key, determining who sees what and when.

## Flow
1. Patient logs into Frankly using secure, verified digital ID.
2. Patient views their complete EMR (lab results, imaging, doctor notes, genomics).
3. Patient initiates a sharing request — e.g., to a specialist.
4. Frankly triggers a smart contract that logs consent parameters (who, what, how long).
5. Specialist accesses only the approved records.
6. Patient can revoke access any time, and revocation is also hashed.

## Safeguards
- All access attempts generate hashes and alerts.
- No backend party can override patient permissions.
- Emergency access provisions are patient-defined in advance.
