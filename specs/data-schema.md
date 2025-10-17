# 📊 Data Schema & Standards

Frankly EMR is built on standardized, interoperable medical data to ensure global compatibility, ease of analysis, and patient ownership.

---

## 🧬 Core Format: FHIR

Frankly uses **FHIR (Fast Healthcare Interoperability Resources)** as the backbone for data modeling. Each patient interaction is stored as a discrete FHIR resource (e.g., `Patient`, `Observation`, `Medication`, `AllergyIntolerance`).

Why FHIR:
- Internationally recognized
- Modular and extensible
- Compatible with blockchain-based metadata hashing

---

## 🔑 Blockchain-Mapped Fields

Each FHIR resource is accompanied by a **cryptographic hash** that is recorded on the blockchain.

Tracked elements include:
- `Resource ID`
- `Last Modified Timestamp`
- `Author / Modifier Public Key`
- `Access Log Event ID`
- Consent reference (linked to `ConsentRegistry.sol`)

---

## 🔐 Patient Identifiers

Frankly uses **Decentralized Identifiers (DIDs)** in place of national IDs or hospital MRNs.

Example:
```json
{
  "id": "did:frankly:123456abcdef",
  "type": "Patient",
  "name": [
    {
      "family": "Santos",
      "given": ["Maria"]
    }
  ],
  "telecom": [...],
  ...
}
