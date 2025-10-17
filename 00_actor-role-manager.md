# 00_actor-role-manager.sol – Documentation

This smart contract defines the **roles and permissions** system for Frankly EMR.

It ensures that only **recognized actors** — such as physicians, researchers, administrators, or auditors — can participate in the ecosystem. This is not patient consent (that’s handled separately); this is **role-based system access**.

---

## 🔐 Purpose

The `actor-role-manager` contract allows us to:

- Assign system-level roles like `Physician`, `Researcher`, `Regulator`, `Admin`
- Manage who has authority to access, contribute, or validate medical records
- Log role changes and permission grants on-chain
- Support modular authorization without bottlenecks or overreach

---

## 🧠 Why This Matters

Frankly EMR is built as a **consent-led system**, but consent means nothing if the people receiving it are anonymous or unauthorized.

This contract:
- Defines the **known actors** within the ecosystem
- Provides a **public registry** of who has which system-level role
- Allows for trustable, inspectable permissions architecture

---

## 🧩 Key Functions (Examples)

| Function | Description |
|----------|-------------|
| `grantRole()` | Assigns a system role (e.g. Physician) to a wallet |
| `revokeRole()` | Removes a role from a wallet |
| `hasRole()` | Checks if an address currently has a role |
| Event Logs | Emits events for every role grant or removal, creating an audit trail |

---

## 🧱 Real-World Analogy

Think of this as a **staff badge printer** and **access gatekeeper**.

Patients still control who accesses their data — but this contract decides who is even allowed to *ask* for that access in the first place.

---

## 📦 Related Files

- `contracts/00_actor-role-manager.sol` – Smart contract that defines the role logic
- `contracts/01_patient-consent-registry.sol` – Patient-granted data access
- `README.md` – Project overview
