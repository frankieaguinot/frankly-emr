# 📊 Data Schema & Standards

Frankly EMR is built on **standardized, interoperable medical data** to ensure global compatibility, ease of analysis, and uncompromising patient sovereignty.

---

## 🧬 Core Format: FHIR

Frankly uses **FHIR (Fast Healthcare Interoperability Resources)** as the backbone for data modeling.  
Every patient event — from a vital sign to a diagnostic image — is stored as a discrete FHIR resource (e.g., `Patient`, `Observation`, `Medication`, `AllergyIntolerance`).

### Why FHIR?
- 🌍 Internationally recognized
- 🧩 Modular and extensible
- 🔗 Compatible with blockchain-based metadata hashing
- 📥 Cleanly exportable to external systems or clinical research platforms

---

## 🔑 Blockchain-Mapped Fields

Each FHIR resource is **paired with a cryptographic hash** that is recorded immutably on-chain.

**Tracked elements include:**
- `Resource ID`
- `Last Modified Timestamp`
- `Author / Modifier Public Key`
- `Access Log Event ID`
- Consent scope hash (from `ConsentRegistry.sol`)
- Off-chain pointer (e.g. IPFS CID or secure URL)

This design ensures that:
- No patient data is stored on-chain
- All records are verifiable
- Consent and access are fully auditable

---

## 🧠 Example: Observation Resource

```json
{
  "resourceType": "Observation",
  "id": "obs-1001",
  "subject": {
    "reference": "did:frankly:123456abcdef"
  },
  "valueQuantity": {
    "value": 98.6,
    "unit": "F"
  },
  "status": "final",
  "meta": {
    "lastUpdated": "2025-10-17T12:34:56Z"
  }
}
