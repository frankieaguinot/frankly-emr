# 05_custom-role-permission-map.md – Custom Role Design & Access Framework

Frankly EMR is built to be **modular, extendable, and consent-first**.  
While core roles like `Physician`, `Researcher`, and `Agency` are included out of the box,  
**institutions may need to create custom roles** such as `HR`, `Billing`, `Legal`, or `Quality Assurance`.

This guide helps administrators design those roles *without compromising sovereignty, transparency, or ethical control*.

---

## 🧠 What This Is

This is a decision-making framework to help you answer:

- “Who really needs access to what?”
- “How do we define a new role responsibly?”
- “What kind of consent is needed?”
- “Should this be a direct role, or proxied through a patient-facing intermediary?”

---

## 🪜 Step-by-Step: Creating a Custom Role

### 1. Name the role clearly  
E.g. `BillingCoordinator`, `ClinicalAuditor`, `LabCourier`

### 2. Define the **function**  
What task does this role perform? Who benefits? Is it service-facing or internal?

### 3. Identify the **data scopes** needed  
What categories of patient data does this role touch?
- Demographics?
- Insurance records?
- Medication logs?
- Lab results?

### 4. Determine access **conditions**  
When should this role be able to act?
- Only after treatment?
- Only with explicit patient click-through?
- Only if flagged for investigation?

---

## ❓ Role Access Checklist

Before granting access to a new role, ask:

| Question | Must be True? |
|----------|---------------|
| Does this role directly impact patient care, safety, or legal compliance? | ✅ |
| Can its task be performed without direct access to clinical records? | If yes, restrict |
| Will access be **read-only**, or does it include logging/editing? | Define clearly |
| Is the patient aware this role exists? | Preferably yes |
| Can consent be **granular** to this role's function? | Always yes |
| Is this access **time-limited or renewable**? | Preferably yes |
| Is every access event **logged and visible**? | Always yes |

---

## 📋 Sample Role Mappings

| Role Name | Likely Access Scope | Consent Needed | Notes |
|-----------|---------------------|----------------|-------|
| BillingCoordinator | Billing codes, insurance data | Patient opt-in (can be bundled with intake) | No clinical data |
| HRManager | Employment-linked health clearances | Limited scope, strict log | May require regulatory compliance |
| LegalAuditor | Access logs, policy infractions | Requires written legal trigger + patient notification | Should never see raw health data |
| LabCourier | Pickup/dropoff metadata only | Not patient-facing — handled by lab | No direct access to EMR |
| TreatmentNavigator | Coordination of services, referrals | Yes, granular scope | Should be trained in consent dialogue |

---

## 🛡️ Design Guardrails

- ❌ Never create “God Mode” roles — every role must be scoped, revocable, and accountable
- ✅ Use hashed `scopeDescriptor` strings for any consent-related mapping
- ✅ Combine roles with zero-knowledge proofs for extra protection (future feature)
- ✅ Prefer modular design: break large roles into atomic functions if possible

---

## 🧾 Audit & Revocation Best Practices

- All role assignments should be:
  - **Time-bound**
  - **Logged** on-chain
  - **Revocable** by the patient or admin
- Implement **“Permission Expiry Alerts”** in your off-chain system
- Review all custom roles quarterly

---

## 🗂 Related Files

- `contracts/00_actor-role-manager.sol` – Role assignment logic
- `contracts/01_patient-consent-registry.sol` – Consent & scope definitions
- `specs/01_patient-consent-registry.md` – Consent design explainer
- `specs/system-architecture.md` – Global overview

---

## 🧩 Final Thought

Every custom role is a **proxy for trust**.  
Design them like you would design a scalpel: sharp, useful — and absolutely safe in the right hands.

---

© 2025 Francheska Aguinot (pseudonym: Frankie Aguinot)  
Frankly EMR Proof Folder — Version 1.1  
U.S. Copyright Office Case #1-15046837951  
Licensed under Creative Commons BY-NC 4.0.
