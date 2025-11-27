# 04_government-oversight.sol – Documentation

This smart contract governs **government agency access** to patient health data under the strict guardrails of **patient-granted, scope-limited consent**.

It ensures that oversight actions are:
- **Permissioned** on a per-patient basis
- **Scoped** to clearly defined purposes
- **Logged** immutably for full transparency

---

## 🧠 What This Contract Handles

- Verifies government agency roles via `00_actor-role-manager.sol`
- Confirms consent validity for the requested data scope
- Logs the oversight action with:
  - Hashed scope (e.g. “infectious-disease-reporting-Q2”)
  - Plaintext justification (e.g. “required by public health policy”)
  - Optional metadata (e.g. case ID, warrant doc, policy link)
  - Timestamped event emission

---

## 🔐 Oversight Flow

1. A patient explicitly grants access to a government agency for a defined scope.
2. The agency invokes `logOversightAccess()` with:
   - `scopeHash` (data being accessed)
   - A reason for access
   - Optional metadata
3. The contract:
   - Verifies the agency’s role
   - Checks the scope against patient consent
4. If valid, an immutable access event is logged.

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `logOversightAccess(address grantee, bytes32 scopeHash, string reason, string metadata)` | Logs agency access if patient consent is valid |

---

## 🧱 Real-World Analogy

Imagine a **locked drawer of sensitive records** in a public office.  
A government agent must:
- Show a signed permission slip from the patient
- Clearly state what they're opening
- Explain why
- Record it in a permanent, public-access ledger

No invisible logs. No secret audits. Just accountable oversight — by design.

---

## 📂 Related Files

- `contracts/04_government-oversight.sol` – Solidity source
- `contracts/01_patient-consent-registry.sol` – Consent verification
- `contracts/00_actor-role-manager.sol` – Role enforcement

---

© 2025 Francheska Aguinot (pseudonym: Frankie Aguinot)  
Frankly EMR Proof Folder — Version 1.1  
U.S. Copyright Office Case #1-15046837951  
Licensed under Creative Commons BY-NC 4.0.
