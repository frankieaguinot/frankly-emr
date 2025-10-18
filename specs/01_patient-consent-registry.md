# 01_patient-consent-registry.sol – Documentation

This smart contract governs **patient-controlled consent** within the Frankly EMR system.

Patients explicitly decide which providers can access their records. Consent is:
- **Revocable**: the patient can withdraw access anytime
- **Auditable**: every action is hashed and logged
- **Scope-limited**: tied to specific use cases via hashed descriptors

---

## 🧠 What This Contract Handles

- Patient-managed access permissions
- Consent grant and revocation per provider
- Scope control using hashed descriptors
- Metadata references for off-chain data (IPFS, JSON, etc.)
- Real-time access checks via `isPermitted()`

This allows fine-grained control without exposing raw data — aligning with zero-trust principles and real-world flexibility.

---

## 🔐 Consent Flow

1. **Patient is identified via DID** (e.g., `did:frankly:123...`)
2. **Provider requests access**
3. **Patient grants consent** through the interface, including:
   - `scopeHash` (e.g., “lab results Jan–Mar 2023” hashed)
   - Optional metadata URL or IPFS pointer
4. **System logs the event** via blockchain hash
5. **Provider can access only if:**
   - Scope matches
   - Consent is still valid
6. **Patient may revoke consent anytime**, instantly cutting access

---

## 🌐 Decentralized Consent Control

In Frankly, consent is **not tied to a specific clinic or institution**.  
It’s tied to the **patient**, and enforced by cryptographic logic.

This makes consent:
- Portable across hospitals
- Durable across time
- Traceable under audit

This is particularly important in regions where doctors practice at multiple hospitals — like the Philippines — ensuring providers don’t lose access due to institutional silos.

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `grantConsent(address grantee, bytes32 scopeHash, string metadata)` | Patient grants access to a provider |
| `revokeConsent(address grantee)` | Patient revokes previously granted access |
| `getConsent(address patient, address grantee)` | Returns the full consent record |
| `isPermitted(address patient, address grantee, bytes32 scopeHash)` | Checks if access is currently permitted |

All actions emit corresponding events for **on-chain logging and audit integrity**.

---

## 🧱 Real-World Analogy

This is like a **digital permission slip folder**:
- The patient fills out each consent form
- They sign, date, and optionally attach supporting notes
- If they tear up a slip, access is revoked — but the original entry is still on record

---

## 🗃 Related Files

- `contracts/01_patient-consent-registry.sol` – Solidity source
- `contracts/00_actor-role-manager.sol` – Role management and registration
- `specs/data-schema.md` – DID-based identity, hashed field structures
