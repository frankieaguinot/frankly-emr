# Frankly EMR – System Architecture Overview

Frankly EMR is a modular, blockchain-based health data system designed to restore **data sovereignty**, enforce **consent-first access**, and build **verifiable audit trails** across the full lifecycle of patient care — from intake to post-treatment reporting.

This document outlines the smart contract structure, role architecture, and consent mechanics that govern the system.

---

## 🧱 Core Design Principles

| Principle | Description |
|----------|-------------|
| **Patient-Centric Control** | Patients are the *primary actors* and own their data cryptographically |
| **Scope-Based Consent** | Access is defined by hashed descriptors (e.g., data type + time range) |
| **Auditability by Default** | All actions emit events to an immutable ledger |
| **No Default Trust** | All permissions must be granted, revocable, and transparent |
| **Ethical Fencing** | Roles must be scoped, temporary, and well-justified |

---

## 📦 Smart Contract Modules

| Contract File | Purpose | Folder |
|---------------|---------|--------|
| `00_actor-role-manager.sol` | Assigns and verifies actor roles like patients, providers, agencies | `contracts/` |
| `01_patient-consent-registry.sol` | Stores granular consent records and permission states | `contracts/` |
| `02_researcher-access-log.sol` | Enables researchers to log access events with scope + metadata | `contracts/` |
| `03_physician-interaction-log.sol` | Allows providers to log treatment-related interactions | `contracts/` |
| `04_government-oversight.sol` | Enables agencies to log access for oversight, if permitted | `contracts/` |

Each is paired with a detailed `.md` file in `specs/`, documenting its structure, purpose, and real-world analogy.

---

## 🔐 Consent + Scope Logic

Frankly uses a **hash-based consent system**:
- Consent is **not a boolean**; it includes:
  - Actor identity
  - `scopeHash`: a hash of the access window, data fields, and purpose
  - Metadata: optional off-chain link (IPFS, JSON pointer, etc.)
- Consent is always:
  - **Granted by patient**
  - **Revocable**
  - **Version-controlled**
  - **Auditable on-chain**

---

## 🧭 Custom Role Design

See [`05_custom-role-permission-map.md`](./05_custom-role-permission-map.md) for a guide to defining institution-specific roles (e.g. billing, HR, legal) with scoped access.

All roles must:
- Be mapped to specific functions
- Justify why access is needed
- Be designed for revocability and transparency

---

## ⚙️ External Integration

Frankly assumes integration with:
- **Off-chain data storage systems** (e.g., S3, IPFS, institutional databases)
- **Patient-facing apps** (wallets, dashboards)
- **Regulatory API layers** (reporting, compliance bridges)

Contracts do not store raw data — only hashed consent metadata and logs.

---

## 🧾 System Guarantees

| Action | Guarantee |
|--------|-----------|
| Provider access | Patient has granted matching consent hash |
| Research data use | Logged with scope, metadata, and timestamp |
| Government audit | Logged transparently if consented |
| Patient revokes | Contract enforces access change immediately |
| Admin defines new role | Must pass checklist from `05_custom-role-permission-map.md` |

---

## 🗃 Related Docs

- `specs/01_patient-consent-registry.md` – Consent structure + flow
- `specs/05_custom-role-permission-map.md` – How to design new roles ethically
- `contracts/` – Solidity smart contract implementations

---

## 🧠 Final Thought

Frankly EMR doesn’t just store health records — it **encodes accountability**.  
Every action is a signature. Every access is a story. Every permission is earned, not assumed.

--- 

© 2025 Frankie Aguinot, MD. All rights reserved under CC BY-NC 4.0.
