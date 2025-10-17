# 02_physician-data-interaction.sol – Documentation

This smart contract allows physicians to **log access to patient data** within the Frankly EMR system — but **only when patient consent is valid**.

It doesn't store medical records directly. Instead, it records **who accessed what, when, and why**, using hashed categories and public events for traceability.

---

## 🧠 What This Contract Handles

- Verifies access using `00_actor-role-manager.sol` and `01_patient-consent-registry.sol`
- Allows **only authorized physicians** to log interactions
- Emits auditable events for each data access
- Tracks the purpose and metadata (e.g. diagnostic reasoning, off-chain record pointer)

---

## 🔐 Access Flow

1. A **patient grants consent** to a physician (via `ConsentRegistry`)
2. A **physician initiates access** using `accessPatientData()`, including:
   - A hash describing the data category (e.g., `labs-Q1-2023`)
   - A human-readable purpose (e.g., "follow-up diagnosis")
   - Optional metadata (e.g., link to diagnostic tool or summary)
3. The contract:
   - Checks if the physician has been granted access
   - Verifies the consent scope matches the request
   - Emits a `DataAccessed` event

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `accessPatientData(address, bytes32, string, string)` | Logs a physician's access attempt if permitted |

---

## 🧱 Real-World Analogy

Think of this contract as a **digital chart sign-in sheet**:  
Every time a doctor opens a patient's folder, they must first show their permission slip —  
and their name, reason, and timestamp are inked into the ledger for all to see.

---

## 📂 Related Files

- `contracts/02_physician-data-interaction.sol` – Solidity source
- `contracts/01_patient-consent-registry.sol` – Consent logic
- `contracts/00_actor-role-manager.sol` – Role assignment and access roles
