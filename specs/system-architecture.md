# Frankly EMR: System Architecture Overview

## 🔧 Architectural Philosophy
Frankly is designed as a modular, interoperable system anchored by **blockchain-based auditability**, **patient-controlled access**, and **end-to-end lifecycle transparency**. It is engineered to be adaptable — governments, clinics, researchers, and individuals can deploy only what they need.

This document outlines the system architecture with components grouped by purpose.

---

## 🏗️ Core Architecture

### 1. **Blockchain Layer (Audit + Provenance)**
- **Platform**: Permissioned Blockchain (e.g. Hyperledger Fabric or Polygon PoS)
- **Data Type Stored**: Immutable hashes + access logs, not raw medical data
- **Smart Contracts**:
  - AccessControl.sol (governs data permissions)
  - ConsentRegistry.sol (records patient opt-ins/opt-outs)
- **Audit Trail**: Every access/write attempt generates a verifiable hash

### 2. **Data Storage Layer (Off-Chain)**
- **Patient Records**: FHIR-compliant JSON documents
- **Encryption**: AES-256 for data-at-rest, TLS for data-in-transit
- **Location**: Decentralized file storage (IPFS/Filecoin) or encrypted cloud storage

### 3. **Access Control Engine**
- **Private Key System**: Patients hold private keys for their own data
- **Roles**: Patients, Providers, Researchers, Government Auditors
- **Logic**: Defined by AccessControl.sol smart contract

### 4. **APIs and Interoperability**
- **FHIR + HL7 compatible** REST APIs
- **Decentralized Identity (DID)** support for cross-system authentication
- **Oracles** to ingest lab results, government databases, or clinical trial metadata

---

## 👥 User Interface Layers

### 1. **Physician Portal**
- Patient search with consent-based access
- Full audit trail visibility
- Smart filters for comorbidities, prescriptions, and contraindications

### 2. **Patient App**
- Timeline view of all interactions (like a blockchain explorer for their health)
- Grant/revoke access to doctors, researchers
- Upload own data (journals, wearables)

### 3. **Researcher Portal**
- Request anonymized cohort access
- View ZK-proven summary stats before applying
- Export de-identified datasets based on scope of permission

### 4. **Regulatory Dashboard**
- Real-time de-identified monitoring (usage trends, access violations)
- No direct data access — built on ZK proofs + access logs only

---

## 🧠 AI and Automation Layer
- **Triage Engine**: NLP-powered symptom checker that routes urgency (can be LGU-deployed)
- **Compliance Monitor**: AI-assisted flagging of outlier access or inappropriate use
- **Redundancy Plan**: Human-in-the-loop escalation for edge cases

---

## 🔐 Security & Ethics
- **Zero-Knowledge Proofs (ZKPs)**: Used to validate research queries without exposing raw data
- **Consent Architecture**: Built-in at every touchpoint
- **Digital Sovereignty**: Patient data never monetized, mined, or sold

---

## 🌀 Deployment Options
- Local Government Units (LGU)
- Hospital Networks
- NGOs + Researchers
- Personal EMR for individuals

---

This architecture intentionally overbuilds so adopters can customize their level of granularity, transparency, and compliance — from rural clinics to international research collaborations.
