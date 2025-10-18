# 🧭 Project Overview – Frankly EMR

Frankly EMR is a decentralized, consent-driven electronic medical records (EMR) system that puts **patients at the center** of their health data.

It leverages blockchain technology to enforce **cryptographic access control**, enable **auditable data flows**, and ensure **portability across institutions** — without compromising privacy.

---

## 🎯 Purpose

Modern EMRs often silo data within institutions, hiding access logs and giving patients little control. Frankly was designed to:

- **Restore patient sovereignty**
- **Enable ethical oversight** without overreach
- **Standardize data** for research and cross-border care
- **Prove accountability** via immutable logs

---

## 🧱 What Makes Frankly Different

| Feature | Description |
|--------|-------------|
| Consent-First Design | No access is allowed unless explicitly granted by the patient |
| Modular Smart Contracts | Granular roles and responsibilities, coded into the system |
| DID-based Identity | Supports global use without relying on national IDs |
| Verifiable Audit Trails | Every access or change is publicly logged and timestamped |
| Hybrid Storage | Data pointers live on-chain; heavy files stay off-chain (e.g., IPFS) |
| Built for Extension | Can scale from small clinics to national health systems |

---

## 🏥 Target Users

- **Physicians** – View patient records across facilities with patient consent  
- **Researchers** – Request scoped, auditable access for ethical data analysis  
- **Patients** – Own and manage their data via wallet-based interfaces  
- **Governments** – View aggregate data (if permitted) for health policy and oversight

---

## 🔗 Repo Structure

| Folder | Purpose |
|--------|---------|
| `contracts/` | Solidity smart contracts governing access and data events |
| `specs/`     | Technical documentation + system architecture |
| `images/`    | (Optional) Diagrams, charts, etc. |
| `README.md` | Main orientation for developers |
| `00_project-overview.md` | Vision, value, and architecture summary |

---

## 🌍 Portability by Design

Frankly works **across hospitals**, **across regions**, and **across use cases** — from chronic care to public health analytics.

All you need is a browser and consent.

---

## 🧠 Learn More

- [Consent Registry Spec](specs/01_patient-consent-registry.md)
- [System Architecture](specs/06_system-governance-architecture.md)
- [Data Schema](specs/data-schema.md)
