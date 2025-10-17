# 01_patient-consent-registry.sol – Documentation

This smart contract governs **patient-controlled consent** within the Frankly EMR system.

Patients explicitly decide which providers can access their records, and consent is **revocable**, **auditable**, and **scope-limited** using hash identifiers.

---

## 🧠 What This Contract Handles

- Patient self-managed access permissions
- Consent grant and revocation per provider
- Scope-based control using hashed descriptors
- Real-time access checks using `isPermitted()`
- Metadata pointers for off-chain context (e.g. JSON, IPFS)

---

## 🔐 Consent Flow

1. **Patient uses their wallet** to grant access
2. **Consent includes**:
   - A `scopeHash` (e.g., hash of "lab results from Jan–Mar 2023")
   - Optional metadata link (JSON, IPFS, etc.)
3. **Provider can access** data if scope matches and consent is active
4. **Patient can revoke** consent at any time
5. **All actions emit events** for traceable audit logs

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `grantConsent(address grantee, bytes32 scopeHash, string metadata)` | Patient grants access to a provider |
| `revokeConsent(address grantee)` | Patient revokes previously granted access |
| `getConsent(address patient, address grantee)` | Returns the full consent record |
| `isPermitted(address patient, address grantee, bytes32 scopeHash)` | Checks if access is currently permitted |

---

## 🧱 Real-World Analogy

This is like a digital **permission slip folder** —  
The patient writes, signs, and dates every consent form themselves,  
and can shred it at will — *while the system logs everything in ink.*

---

## 🗃 Related Files

- `contracts/01_patient-consent-registry.sol` – Solidity source
- `contracts/00_actor-role-manager.sol` – Role management and registration
