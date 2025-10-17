# 04_government-oversight.sol – Documentation

This smart contract governs **regulated access by government agencies** to patient health data — under patient-granted, scope-limited consent.

It ensures that any oversight access is:
- Explicitly permissioned
- Scope-restricted
- Fully logged with purpose and metadata

---

## 🧠 What This Contract Handles

- Verifies government agency roles via `AccessControl`
- Confirms whether patient consent covers the requested scope
- Emits an immutable log of access, including:
  - The scope (as a hash)
  - The justification (e.g., mandatory reporting)
  - Metadata (e.g., case ID, warrant link, policy ref)
  - Timestamp

---

## 🔐 Oversight Flow

1. The patient explicitly grants access to an agency for a specific scope
2. The agency calls `logOversightAccess()` with:
   - A `scopeHash` of the permitted domain (e.g., "reportable-diseases-Q2")
   - A justification string
   - Optional metadata pointer
3. The contract checks:
   - Does the agency have the right role?
   - Has this scope been permitted by the patient?
4. If both checks pass, the event is emitted publicly

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `logOversightAccess(address, bytes32, string, string)` | Logs a government agency’s access to patient data |

---

## 🧱 Real-World Analogy

This contract is like a **locked drawer of health records**:  
A government agency can only open it with the patient’s key — and only if they write down *exactly why*, *what they looked at*, and *when*.

No blanket powers. No invisible logs. Only transparency.

---

## 📂 Related Files

- `contracts/04_government-oversight.sol` – Solidity source
- `contracts/01_patient-consent-registry.sol` – Consent scope logic
- `contracts/00_actor-role-manager.sol` – Role-based access assignment
