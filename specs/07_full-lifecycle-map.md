# Lifecycle Tracking Map – Frankly EMR

Frankly EMR tracks the **entire lifecycle of high-scrutiny medications and clinical interventions** — from raw material sourcing to patient outcomes and waste disposal. It uses blockchain hashes and AI-driven anomaly detection to ensure **traceability, accountability, and real-world oversight**.

---

## 🔁 Lifecycle Phases

### 1. Raw Material Procurement
- Supplier identity verified via Decentralized ID (DID)
- Source certifications logged
- Intake batch ID and composition hashed on-chain
- AI may check supplier risk profile

### 2. Manufacturing & Packaging
- Batch-to-lot mapping recorded
- Time-stamped logs: temperature, humidity, QA checkpoints
- Dosage form recorded (e.g., pill, injectable, liquid)
- Hashes created for each sub-batch + signed by manufacturer DID

### 3. Supply Chain & Shipping
- Chain-of-custody documented
- GPS, cold-chain compliance, handoff hashes
- Smart contracts record custody transfer with timestamped logs
- Packaging unit may contain hash-accessible QR/NFC for scanning

### 4. Prescription & Dispensation
- Physician scripts medicine to patient DID
- Quantity, dosage, instructions logged on-chain
- Pharmacist verifies dose, dispenses with hash
- Pill-level or mg-level granularity tracked

### 5. Clinical Use, Monitoring & Lab Testing
- Patient intake acknowledged (manual or via device)
- AI flags discrepancies (e.g., more meds consumed than prescribed)
- Side effects logged via patient or clinician
- Compliance verified through lab testing or smart device
- Optional metadata includes diagnostic context or care notes

### 6. Excretion & Downstream Monitoring
- Renal/hepatic burden labs (e.g., GFR, LFTs) logged
- Metabolite presence tracked to confirm compliance
- Environmental release protocols (for investigational/nuclear drugs)
- Waste logging optional but hash-linked to earlier batch chain

### 7. Oversight, Alerts & Audit
- Researchers or government bodies can access mg-level logs
- Consent required for each audit
- AI proactively flags early refills, underuse, overuse
- Real-time alerting possible (e.g., overdose risk, toxic side effects)
- Logs are patient-specific and cryptographically verifiable

---

## 📊 Lifecycle Flow Diagram (Text-Based)

```plaintext
[Raw Material Procurement]
|
v
[Manufacturing & Packaging]
|
v
[Supply Chain & Shipping]
|
v
[Prescription & Dispensation]
|
v
[Clinical Use & Monitoring]
|
v
[Excretion & Downstream Monitoring]
|
v
[Oversight / AI Alerts / Audits]
```

---

© 2025 Frankie Aguinot, MD. All rights reserved under CC BY-NC 4.0.
