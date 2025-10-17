# AccessControl.sol – Documentation

This smart contract governs **role-based access control** for Frankly EMR.

It is the gatekeeper — ensuring that **only authorized parties** can view, modify, or interact with a patient's data. Every access attempt is recorded on an immutable ledger for traceability and auditability.

---

## 🔐 Purpose

The AccessControl smart contract allows us to:
- Assign roles like `Patient`, `Physician`, `Admin`, and `Laboratory`
- Control access to sensitive operations
- Log all permission changes via hash entries
- Revoke or modify access dynamically without compromising security

---

## 🧠 Why This Matters

Frankly EMR is not just a data storage system — it’s a **consent-driven framework**.

In a traditional EMR:
- Access is controlled by institutions.
- Patients often don’t know who has viewed or modified their record.

In Frankly:
- Access is coded via smart contracts.
- Patients retain **cryptographic sovereignty** over their data.

---

## 💡 Key Features

| Feature | Description |
|--------|-------------|
| `grantRole()` | Assigns a role to a specific address |
| `revokeRole()` | Removes a previously granted role |
| `hasRole()` | Checks whether a user has a specific role |
| Event Logs | Every access event emits a log, creating a hash-based audit trail |

---

## 🧱 Real-World Analogy

Think of this contract as a **digital front desk** with a bouncer.  
Nobody gets in unless they’re on the list — and every entry or exit is written down permanently in ink.

---

## 📦 Related Files

- `contracts/AccessControl.sol` – Source code
- `README.md` – Project overview
