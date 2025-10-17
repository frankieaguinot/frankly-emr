# Core System Architecture – Frankly EMR

This document outlines the **technical backbone** of Frankly — a blockchain-based electronic medical records (EMR) system designed for traceability, consent architecture, and global patient sovereignty.

---

## 🧱 Key Architectural Components

| Layer | Description |
|-------|-------------|
| **Frontend** | Physician & patient portal UI (web or app) |
| **Application Layer** | Business logic handling interactions between frontend and smart contracts |
| **Smart Contracts** | Role-based access, data registry, audit logging |
| **Blockchain Layer** | Immutable ledger (e.g., Ethereum, Polygon, etc.) |
| **Off-chain Storage** | IPFS or encrypted cloud storage for bulky files (e.g., scans, images) |
| **Oracles** | Bridge between real-world data (lab results, insurance verification) and blockchain |

---

## 🔁 End-to-End Flow

1. **Patient logs in** using decentralized ID (DID) or secure credentials.
2. **Physician requests access** to patient records via smart contract.
3. **Patient grants or denies** access through an interface.
4. **If granted**, physician sees on-chain references and off-chain data pointers.
5. **Any access or modification** triggers an event — creating a hash and recording it immutably.

---

## 🔐 Blockchain + Off-Chain Strategy

Due to size limitations on-chain, Frankly uses a **hybrid architecture**:

- **On-chain**: 
  - Consent logs
  - Access control
  - Data hashes (fingerprints)
- **Off-chain**:
  - Images
  - Genomic files
  - Lab results

Files are referenced by their hash — proving they haven’t been tampered with.

---

## 🔍 Example Use Case: Consent Flow

1. Dr. Reyes wants to review Maria’s PET scan.
2. Dr. Reyes submits a smart contract request.
3. Maria is notified and grants access via UI.
4. The system logs a hash of the consent event on-chain.
5. Dr. Reyes receives access to the scan’s IPFS link, verified by hash.

---

## 📤 Exportable Architecture

Frankly was intentionally **overbuilt** to support multiple use cases:

- **Decentralized national EMR system**
- **Pharma-to-patient compliance tracking**
- **Clinical trials + supply chain audit**
- **Cross-border patient care**

The repo is modular — adopters can strip it down to fit small clinics or scale it for national health systems.

---

## 🔄 Integration Points

- **Insurance API**
- **Pharmacy stock chain**
- **Genomic database**
- **Telemedicine**
