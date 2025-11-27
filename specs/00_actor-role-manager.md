# 00_actor-role-manager.sol - Documentation

This smart contract governs role-based access control for Frankly EMR.

It is the gatekeeper, ensuring that only authorized parties can view, modify, or interact with patient-linked data. Every permission event is transparently logged on-chain for auditability and traceability.

---

## 🔐 Purpose

The Actor Role Manager contract allows us to:

- Assign system roles like Patient, Provider, and Admin  
- Grant or revoke access to individual actors  
- Enforce access via modifiers in other smart contracts  
- Emit event logs for every permission change  

This design is decentralized but verifiable, maintaining patient sovereignty while supporting real-world oversight.

---

## 🧠 Why This Matters

Frankly EMR is designed for lifespan-long traceability and consent-driven access, which means we need to:

- Track who is trying to access data  
- Verify if they are allowed to  
- Record when that permission was granted or revoked  

Unlike legacy EMRs, Frankly EMR decouples identity from institutions. Actors are assigned roles using DIDs (Decentralized Identifiers), which allows for portable access control.

This means:

- A doctor who practices in multiple hospitals can retain access across all  
- A patient can receive care from multiple clinics without fragmented records  
- Roles are defined by relationship, not employment  

---

## 🧱 Key Functions

| Function                    | Description                          |
|----------------------------|--------------------------------------|
| `registerPatient(address)` | Admin assigns a Patient role         |
| `registerProvider(address)`| Admin assigns a Provider role        |
| `grantAccess(address)`     | Patient grants access to a provider  |
| `revokeAccess(address)`    | Patient revokes access from a provider |
| `hasAccess(address,address)` | View current permission status     |

Each action emits an event that is immortalized via blockchain hash, forming the audit trail for access control.

---

## 🧱 Real-World Analogy

Think of this as a keycard management system.  
Hospitals do not just let anyone into the ICU. Access is granted based on roles, and logged every time the door opens.

Frankly EMR simply makes the keycards digital, cryptographic, and globally portable.

---

## 🌐 Identity Across Institutions

This contract assumes that actors are not tied to a single hospital or system.  
They are tracked by DID, not by employee number.

This reflects real-world environments like the Philippines, where:

- Physicians often practice in multiple hospitals  
- Patients may move between clinics and provinces  
- There is no unified national EMR yet  

Frankly EMR enables unified access regardless of institution, with patients maintaining full oversight.

---

## 📦 Related Files

- `contracts/00_actor-role-manager.sol` - Solidity source  
- `contracts/01_patient-consent-registry.sol` - Consent logic built atop roles  
- `data-schema.md` - Field structure, hashing, and DID usage  

---

© 2025 Francheska Aguinot (pseudonym: Frankie Aguinot)  
Frankly EMR Proof Folder — Version 1.1  
U.S. Copyright Office Case #1-15046837951  
Licensed under Creative Commons BY-NC 4.0.
