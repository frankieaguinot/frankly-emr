# Frankly EMR: A Blockchain-Based Medical Record System

**Frankly** is a next-generation, blockchain-powered Electronic Medical Record (EMR) system built to prioritize patient sovereignty, full lifecycle traceability, and compassionate technology. It was designed from the ground up to support sensitive medicines, complex compliance, and edge-case patient populations — starting with the Philippine context, but applicable worldwide.

This repository shares the system design, key components, and ethical licensing for Frankly under a Creative Commons license (Attribution-NonCommercial 4.0 International). 

## 🧠 Core Vision
Frankly began with a radical idea: bring the old paper chart into the future. In the past, a patient carried their folder — they owned it. With Frankly, blockchain makes that idea real again, using:

- **Immutable ledgers** to record every access and change
- **Smart contracts** to automate consent and permissions
- **Decentralized identity (DID)** and **private key** access control
- **Audit trails** that cannot be overwritten or obscured

It’s not just transparency — it’s transparency enforced by design.

## 🔁 Full Lifecycle Architecture
Frankly was architected to cover the full lifecycle of high-scrutiny medications — from raw material to patient excretion:

1. **Raw Material Procurement**
2. **Manufacturing & Packaging**
3. **Supply Chain & Shipping**
4. **Prescription & Dispensation**
5. **Clinical Use, Monitoring & Lab Testing**
6. **Patient Feedback & Outcome Reporting**
7. **Excretion/Disposal Tracking** (if applicable)

Each stage logs a cryptographic **hash** on-chain, producing **end-to-end traceability** that meets or exceeds standards in pharma and nuclear logistics.

## 💡 Design Principles
Frankly was designed with the following pillars:

- **Consent Architecture**: Consent isn’t assumed — it’s coded. Access is patient-directed.
- **Digital Sovereignty**: Patients control their data. They decide who sees what, when, and why.
- **Interoperability**: Built to connect with legacy EMRs, labs, pharmacies, and hospital systems.
- **Human-in-the-Loop**: AI can assist — but decisions remain human, with explainability at the core.

## 🔒 Licensing & Use
This repository and all design files are released under:

**Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)**

### ✳️ Commercial Use Clause (Addendum)
Explicit written permission is required for any commercial implementation or derivative product that:
- Charges users to access their own health data;
- Restricts full patient access through tiered pricing models;
- Obscures or limits auditability, transparency, or patient data ownership through proprietary infrastructure;
- Is deployed by for-profit or nonprofit organizations where revenue is generated from platform use.

This clause exists to prevent Scenario B in *“Two Futures of a Patient”* (Medium, 2025).

## 📂 Repository Structure (To Come)
- `/docs` – Architecture diagrams, UX notes, data layer designs
- `/contracts` – Smart contract templates
- `/specs` – Workflow and technical requirements
- `/mockups` – UI mockups and consent flows

## 🧾 Attribution
Frankly was designed by [Frankie Aguinot](https://www.linkedin.com/in/frankieaguinotmd/), a use-case strategist and technologist focused on digital sovereignty, compassionate innovation, and system ethics.

## 💬 Citation
If referencing this work academically, cite as:
> Aguinot, F. (2025). *Frankly: A Blockchain-Based EMR for Digital Sovereignty and Ethical Transparency*. Creative Commons Attribution-NonCommercial 4.0.

## 🔗 License
This work is licensed under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/).
