# 03_researcher-data-usage.sol – Documentation

This smart contract governs **researcher access to patient data** under explicit, scope-limited patient consent.

It verifies whether a researcher has been granted access for a specific query scope — and if so, **logs the access attempt** immutably with purpose and metadata.

---

## 🧠 What This Contract Handles

- Verifies the researcher's role via `AccessControl`
- Confirms that patient consent exists for the requested query
- Logs the researcher’s access attempt with:
  - The query scope (hashed)
  - The study purpose (human-readable)
  - An optional metadata pointer (e.g., study ID, IPFS link)
- Emits a timestamped event for auditability

---

## 🔐 Research Flow

1. A patient grants **consent** to a researcher for a specific study scope
2. The researcher calls `queryData()` with:
   - A hash representing the data request
   - A brief study purpose
   - Optional metadata (off-chain registry, documents, etc.)
3. The system checks:
   - Is this actor a registered researcher for this patient?
   - Has the patient approved this specific scope?
4. If permitted, an access event is logged

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `queryData(address, bytes32, string, string)` | Logs a researcher’s access attempt if consented |

---

## 🧱 Real-World Analogy

This contract is like a **controlled archive room**:  
Researchers can’t just browse around — they must present a stamped permission form  
for a **specific box of records**, and every request is logged in permanent ink.

---

## 📂 Related Files

- `contracts/03_researcher-data-usage.sol` – Solidity source
- `contracts/01_patient-consent-registry.sol` – Consent logic
- `contracts/00_actor-role-manager.sol` – Role assignment and permissions
