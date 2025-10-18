# 00_project-overview.md

Frankly EMR – Project Overview
==============================

> The **AI-powered user interface (UI)** is the linchpin that bridges complex blockchain technology with the clinician’s need for **simplicity**, **efficiency**, and **speed**.

Frankly EMR was built with one goal: **make advanced tech usable for real people in high-pressure clinical settings.** It was designed by a physician who understood firsthand that no matter how powerful the backend is, if it's frustrating or confusing to use — it won't be used.

---

## 🎯 Why Frankly?

- Healthcare workers are overwhelmed.
- Medical software is bloated and counterintuitive.
- Blockchain solutions are often impractical or inaccessible to non-technical users.

Frankly EMR addresses all three by combining:
- **Consent-based blockchain architecture** (for traceability, control, and auditability)
- **AI-driven UI** (for minimal training and maximum usability)
- **Modular open-source design** (for adaptation at any scale)

---

## 🧠 AI as the Interface

"AI" in Frankly isn’t just for diagnostics — it *is the user interface*.

- The system **guides the user** proactively.
- It pulls **relevant patient data** based on context (e.g., recent labs, old imaging).
- It can auto-generate **summaries, visuals, or flags** without being prompted.
- It’s like a **PA in a box** — always available, never tired.

The **gold standard** we aimed for:  
> A clinician should only need to click the portal link — the EMR will handle the rest.

This isn’t just good UX — it’s **ethical tech design**.  
We believe usability is not a nice-to-have; it’s a *clinical imperative*.

---

## 🧱 Core Architecture

| Layer | Description |
|-------|-------------|
| Frontend | AI-driven clinician and patient UI |
| Application Layer | Business logic and routing |
| Smart Contracts | Role-based access, consent, audit logs |
| Blockchain Layer | Immutable ledger (Ethereum, Polygon, etc.) |
| Off-chain Storage | IPFS / encrypted cloud for bulky files |
| Oracles | Connect real-world events with on-chain data |

---

## 💡 Key Features

- Role-based access control (`00_actor-role-manager.sol`)
- Patient-governed consent (`01_patient-consent-registry.sol`)
- Physician and researcher access logging
- Government oversight controls with auditability
- Fully hashed metadata and event trails
- Modular role expansion via `05_custom-role-permission-map.md`

---

## 📦 Repo Structure

- `contracts/` – Solidity smart contracts
- `specs/` – Markdown specs for each smart contract
- `docs/` – System overviews and technical documentation
- `README.md` – Technical deep dive
- `clinician-overview.md` – Plain-language introduction for healthcare users

---

## 🌍 Use Cases

- National decentralized health records
- Transparent clinical trial tracking
- Global patient-owned record systems
- High-trust pharma supply auditing

---

## 🔓 Built to Be Forked

Frankly is **overbuilt on purpose** — so you can strip it down or scale it up.

Use it as:
- A skeleton for healthtech startups
- A reference for public health infrastructure
- A sandbox for ethical blockchain design

---

## 🧠 Final Thought

This isn’t just software.  
This is what it looks like when technologists and clinicians collaborate to put **human needs first** — without compromising on power, privacy, or precision.
