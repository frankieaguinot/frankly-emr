# 02_physician-data-interaction.sol – Documentation

This smart contract enables physicians to **log data access events** within the Frankly EMR system — but **only when valid patient consent exists**.

It does **not store actual health data**. Instead, it acts as a **cryptographically verifiable log** of:
- Who accessed what
- Why they did it
- When it happened
- Under what scope of permission

---

## 🧠 What This Contract Handles

- Validates provider role via `00_actor-role-manager.sol`
- Confirms active consent via `01_patient-consent-registry.sol`
- Emits public, hashed events for traceability
- Supports metadata linking (e.g., diagnostic tools, notes)

It ensures transparency in access without risking data leaks or abuse.

---

## 🔐 Access Flow

1. **Patient uses DID-based wallet** to grant access to a provider
2. **Physician initiates access** using `accessPatientData()` and submits:
   - `scopeHash` (e.g., “labs-Q1-2023” hashed)
   - A purpose string (e.g., “follow-up diagnosis”)
   - Metadata (e.g., off-chain pointer to note, IPFS, URL)
3. Contract verifies:
   - Caller has the `Physician` role
   - Consent is active and scope matches
4. Logs the action with a `DataAccessed` event

This lets patients (and auditors) see what happened — even years later.

---

## 🌍 Interoperability Note

Physicians aren’t tied to a single clinic or system.  
This contract assumes a **portable identity model** — where:
- A doctor may work in multiple hospitals
- The same DID or public key grants access across systems

Frankly verifies **intent, consent, and event metadata**, not location.

---

## 📦 Function Reference

| Function | Description |
|----------|-------------|
| `accessPatientData(address patient, bytes32 scopeHash, string purpose, string metadata)` | Emits a log if the physician is authorized and consent matches |

All logs are public events and can be indexed for analytics, oversight, or audits.

---

## 🧱 Real-World Analogy

This is like a **digital sign-in sheet on a patient’s folder**:
- The physician writes their name, reason, and time
- But they can’t open the folder unless they show a valid permission slip
- The sheet is stamped in ink (blockchain log) for future review

---

## 📂 Related Files

- `contracts/02_physician-data-interaction.sol` – Solidity source
- `contracts/01_patient-consent-registry.sol` – Consent logic
- `contracts/00_actor-role-manager.sol` – Role assignment and permissions
- `specs/data-schema.md` – ScopeHash construction and ID model 

---
© 2025 Francheska Aguinot (pseudonym: Frankie Aguinot)  
Frankly EMR Proof Folder — Version 1.1  
U.S. Copyright Office Case #1-15046837951  
Licensed under Creative Commons BY-NC 4.0.
