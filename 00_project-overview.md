# Frankly EMR – Project Overview

**Frankly EMR** is a blockchain-based electronic medical record (EMR) system designed for **consent-first architecture**, **traceable access logs**, and **global data portability**.

It was created by [Frankie Aguinot, MD](https://github.com/frankieaguinot) — a physician-engineer building for both doctors and developers.

---

## 🧠 Purpose

Frankly isn’t just another health tech project. It’s a rethinking of data sovereignty, placing patients at the center of access control — not institutions.  
By encoding trust and transparency into the architecture itself, Frankly aims to restore ethical control over health data.

---

## 👥 Audience

This repo serves two audiences:

- **Health professionals** looking to understand how Frankly EMR protects patients and simplifies workflows  
- **Developers and technologists** exploring smart contract implementations, access logic, and system design

---

## 🧱 Architecture Overview

Frankly uses a **modular smart contract** system for:

- Role management
- Consent handling
- Researcher access
- Government oversight

Every access attempt emits a **hash-based event**, creating an auditable trail that can't be altered or hidden.

---

## 📦 What’s Inside

| Folder | Contents |
|--------|----------|
| `contracts/` | Solidity smart contracts governing access and logging |
| `specs/` | Markdown docs describing the structure and function of each `.sol` file |
| `docs/` | System architecture, lifecycle tracking, and technical strategy |
| `README.md` | Entry point to the project |
| `00_project-overview.md` | This file – high-level context for contributors and stakeholders |

---

## ✨ Why This Matters

Frankly EMR supports:

- Cross-border data sharing
- Modular role creation (e.g., for HR, research, or pharmacy)
- Zero-trust access logging
- Sovereign identifiers for patients via DID

This is a foundation for national health systems, clinical trials, small clinics, or startups — built by someone who’s actually stood on both sides of the chart.
