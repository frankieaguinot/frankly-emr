# 01_technical-overview.md

## 🧠 Frankly EMR – Technical System Overview

Frankly EMR is a consent-first, blockchain-backed medical record system built for global scale, institutional nuance, and individual sovereignty.  

This document is for developers, architects, and digital health engineers who want to **understand the why and how** behind the system — and perhaps extend it to new use cases.

---

## 🔐 Core Design Philosophy

| Principle | Why It Matters |
|----------|----------------|
| **Consent as Default** | Access is *never assumed*. Every action is patient-permitted, scope-bound, and revocable. |
| **Traceability by Design** | Every action — from viewing to revocation — emits an event logged immutably. |
| **Modular Solidity Contracts** | Each contract is independently testable, auditable, and replaceable. |
| **Hybrid Architecture** | On-chain consent meets off-chain data (IPFS, encrypted stores, etc.) |
| **Clinical Realism** | Designed with the full care loop in mind — not just hospitals, but supply chains, labs, researchers, and regulators. |

---

## 🧱 Smart Contract Stack

Frankly is split into modular contracts:

- `00_actor-role-manager.sol`  
  Assigns roles like Patient, Physician, Researcher, GovernmentAgent

- `01_patient-consent-registry.sol`  
  Stores and verifies cryptographic consent scopes

- `02_physician-data-interaction.sol`  
  Lets physicians log access events, if consent is valid

- `03_researcher-data-usage.sol`  
  Logs researcher data queries under explicit, limited permission

- `04_government-oversight.sol`  
  Tracks regulated access by health departments and compliance officers

Each emits hashed logs and uses `scopeHash` structures to enforce granular, cryptographic trust.

---

## 🤖 AI as the User Interface

Frankly isn't just built for doctors — it's built **around them**.

Instead of forcing physicians to learn blockchain logic, cryptography, or access keys, we use **AI as a UI layer** — a clinical assistant in code form.  

**The gold standard?**  
A healthcare worker opens a link. That’s it.  
The AI walks them through the rest — verifying access, surfacing the right records, explaining denials, and guiding them to resolution.  

It’s not just a user interface.  
It’s a **PA in a box** — an intelligent system designed to do the thinking *around* the doctor, not for them.

---

## 💊 Why Usability Is a Moral Obligation

We — the builders, engineers, and subject matter experts — carry a responsibility beyond clean code or secure chains.

We’re not just designing systems.  
We’re deciding who gets to use them.  

Just like pharmaceutical companies improve the **taste of medicine** to ensure patient compliance, we must ensure our systems are **intuitive, humane, and usable**.

The best medicine — like the best tech — only works if people are willing and able to use it.  
So we lower the bar not for capability, but for entry.  

**Because power should be accessible. And progress should be shared.**
