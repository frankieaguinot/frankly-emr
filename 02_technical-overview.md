# 01_technical-overview.md

# 🧠 Frankly EMR - Technical System Overview

Frankly EMR is a consent-first, blockchain-backed medical record system built for global scale, institutional nuance, and individual sovereignty.

This document is for developers, architects, and digital health engineers who want to understand the why and how behind the system, and perhaps extend it to new use cases.

⸻

## 🔐 Core Design Philosophy

| Principle | Why It Matters |
|----------|----------------|
| **Consent as Default** | Access is *never assumed*. Every action is patient-permitted, scope-bound, and revocable. |
| **Traceability by Design** | Every action, from viewing to revocation, emits an event logged immutably. |
| **Modular Solidity Contracts** | Each contract is independently testable, auditable, and replaceable. |
| **Hybrid Architecture** | On-chain consent meets off-chain data (IPFS, encrypted stores, etc.). |
| **Clinical Realism** | Designed with the full care loop in mind, not just hospitals, but supply chains, labs, researchers, and regulators. |

⸻

## 🧱 Smart Contract Stack

Frankly EMR is divided into modular Solidity contracts, each performing a specific function:

- `00_actor-role-manager.sol`  
  Assigns and manages roles such as Patient, Physician, Researcher, and GovernmentAgent.  

- `01_patient-consent-registry.sol`  
  Stores and verifies cryptographic consent scopes and revocation states.  

- `02_physician-data-interaction.sol`  
  Logs physician access events, validated by verified patient consent.  

- `03_researcher-data-usage.sol`  
  Records researcher data queries under explicit, time-limited permission.  

- `04_government-oversight.sol`  
  Tracks regulated access by authorized agencies and compliance officers.  

Each emits hashed, timestamped logs and leverages `scopeHash` structures to enforce verifiable, cryptographic trust.

⸻

## 🤖 AI as the User Interface

Frankly EMR is designed around clinicians, not at their expense.

Instead of requiring physicians to learn blockchain logic, encryption, or token management, AI functions as the user interface, a digital physician assistant (PA) that interprets permissions and workflows in real time.

The gold standard:  
A clinician opens a link, and the AI guides them step by step, verifying credentials, surfacing relevant data, explaining any access denials, and maintaining auditability automatically.

This is more than an interface.  
It is an intelligent assistant designed to think around the physician, not for them.

⸻

## 💊 Why Usability Is a Moral Obligation

We, as builders, engineers, and subject matter experts, carry a responsibility that extends beyond security or compliance.

We are not just designing technology.  
We are shaping access, and therefore, equity.

Just as pharmaceutical companies improve the taste of medicine to encourage patient adherence, we must ensure our systems are intuitive, humane, and usable.

The best technology, like the best treatment, only works when it is understood and accessible.  
Usability is not convenience, it is compassion implemented through design.

For the full design philosophy and ethical framework, see:  
- 🌐 Read the original publication on Medium:  
  [Designing a Blockchain EMR for Patient Data Ownership — Medium Article by Frankie Aguinot, MD](https://medium.com/@yourusername/i-designed-a-blockchain-emr-to-protect-patient-data-then-i-open-sourced-it-xxxxxxxxxxxx)  
- 📄 Download the archived PDF version:  
  [Frankly_EMR_Medium_Article_v2_Public_View.pdf](docs/Frankly_EMR_Medium_Article_v2_Public_View.pdf)

⸻

© 2025 Frankie Aguinot, MD. All rights reserved under CC BY-NC 4.0.
