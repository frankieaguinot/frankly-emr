# PhysicianConsentFlow.md

## Purpose
Give providers an EMR that supports—not slows down—clinical decision-making while maintaining patient trust.

## Key Concepts
- **Smart contracts** for treatment updates and referrals.
- **Role-based access**: Front desk ≠ oncologist ≠ pharmacist.
- **Interoperable by design**: Seamlessly connects to other Frankly-compatible providers.

## Flow
1. Physician logs into Frankly via credentialed access.
2. Patient grants case-specific data visibility.
3. Physician reviews history, updates chart, writes prescription.
4. Each entry or edit is hashed and timestamped.
5. If patient changes providers, new physician gets smart contract-based access.
6. Previous physician retains no access unless explicitly re-authorized.

## Safeguards
- Hashes create immutable audit trail.
- No access unless active consent is in place.
- Provider actions are tracked, and questionable edits can trigger internal review.
