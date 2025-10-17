# 01_patient-consent-registry.sol – Documentation

This smart contract governs **patient-controlled consent** within the Frankly EMR system.

Patients explicitly decide which providers can access their records, and consent is **revocable**, **auditable**, and **scope-limited** using hash identifiers.

---

## 🧠 What This Contract Handles

- Patient self-managed access permissions
- Consent grant and revocation per provider
- Scope-based control using hashed descriptors
- Provider and patient registration via owner
- Real-time access checks using `hasAccess()`

---

## 🔐 Consent Flow

1. **Patient is registered** by the system owner
2. **Provider is registered** by the system owner
3. **Patient grants consent** to a specific provider, including:
   - A `scopeHash` (e.g., hash of "lab results from Jan–Mar 2023")
   - Optional metadata link (JSON, IPFS, etc.)
4. **Provider can access** data while consent is valid
5. **Patient can revoke** consent at any time
6. **All actions emit events** for auditability

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `registerPatient(address)` | Owner adds a patient |
| `registerProvider(address)` | Owner adds a provider |
| `grantConsent(address, bytes32, string)` | Patient grants access to a provider |
| `revokeConsent(address)` | Patient revokes previously granted access |
| `hasAccess(address, address, bytes32)` | Check if a provider currently has access for a given scope |

---

## 🧱 Real-World Analogy

This is like a digital **permission slip folder** —  
The patient writes, signs, and dates every consent form themselves,  
and can shred it at will — *while the system logs everything in ink.*

---

## 🗃 Related Files

- `contracts/01_patient-consent-registry.sol` – Solidity source
- `contracts/00_actor-role-manager.sol` – Actor roles (who’s a provider, etc.)
