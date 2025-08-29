# FHE Private Identity Verification

A decentralized identity dApp on **Zama's FHEVM**.  
Users submit encrypted proofs (KYC, age, residency) while the system verifies conditions without exposing sensitive information.

## Why
Identity is critical for DeFi, DAOs, and on-chain apps. Current KYC solutions leak private data. With **FHE**, we can prove attributes privately (e.g., age > 18) while keeping all raw values encrypted.

## Features
- 🔒 **Encrypted KYC**: proofs stored as ciphertext
- ✅ **Binary proofs**: only pass/fail conditions revealed
- 🌍 **Compliance-friendly**: supports AML/KYC checks without data leaks
- 👥 **DAO ready**: enables private proof-of-personhood

## How it works (high level)
1. User submits encrypted identity attributes.
2. Smart contract stores ciphertext + emits events.
3. Verifiers run FHE checks → output a binary proof.
4. Protocols consume proof without ever seeing sensitive info.

## Contracts
- `contracts/Identity.sol` — demo contract storing encrypted proofs and emitting verification results.

## Roadmap
- Frontend to submit encrypted proofs
- Encrypted multi-attribute checks (age + residency + whitelist)
- Integrate with DAO voting and DeFi access control

## Disclaimer
Demo project for FHEVM exploration — not production-ready.
