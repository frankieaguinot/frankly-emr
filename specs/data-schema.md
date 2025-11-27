# 📊 Data Schema & Standards

Frankly EMR is built on standardized, interoperable medical data to ensure global compatibility, ease of analysis, and uncompromising patient sovereignty.

---

## 🧬 Core Format: FHIR

Frankly EMR uses FHIR (Fast Healthcare Interoperability Resources) as the backbone for data modeling.  
Every patient event, from a vital sign to a diagnostic image, is stored as a discrete FHIR resource (for example: `Patient`, `Observation`, `Medication`, `AllergyIntolerance`).

**Why FHIR?**

- 🌍 Internationally recognized  
- 🧩 Modular and extensible  
- 🔗 Compatible with blockchain-based metadata hashing  
- 📥 Cleanly exportable to external systems or clinical research platforms  

---

## 🔑 Blockchain-Mapped Fields

Each FHIR resource is paired with a cryptographic hash that is recorded immutably on-chain.

Tracked elements include:

- Resource ID  
- Last Modified Timestamp  
- Author / Modifier Public Key  
- Access Log Event ID  
- Consent scope hash (from `ConsentRegistry.sol`)  
- Off-chain pointer (for example: IPFS CID or secure URL)  

This design ensures that:

- No patient data is stored on-chain  
- All records are verifiable  
- Consent and access remain fully auditable  

To preserve intellectual property integrity and data protection compliance, the structure and schema mappings of Frankly EMR are covered under the CC BY-NC 4.0 license.  
Unauthorized reproduction or modification of these specifications for commercial or proprietary purposes is strictly prohibited without explicit written consent from Frankie Aguinot, MD.

---

## 🧠 Example: Observation Resource

```json
{
  "resourceType": "Observation",
  "id": "obs-1001",
  "subject": {
    "reference": "did:franklyemr:123456abcdef"
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
```

---

© 2025 Francheska Aguinot (pseudonym: Frankie Aguinot)  
Frankly EMR Proof Folder — Version 1.1  
U.S. Copyright Office Case #1-15046837951  
Licensed under Creative Commons BY-NC 4.0.
