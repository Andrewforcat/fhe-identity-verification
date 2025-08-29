// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * Demo-only contract for FHE-based identity verification.
 * Encrypted data represented by `bytes`. 
 * Real FHEVM environment would perform encrypted checks.
 */
contract Identity {
    struct EncryptedProof {
        address user;
        bytes data;       // ciphertext (e.g., age, residency, ID hash)
        bool verified;
    }

    mapping(address => EncryptedProof) public proofs;

    event ProofSubmitted(address indexed user);
    event ProofVerified(address indexed user, bool result);

    function submitProof(bytes calldata _data) external {
        proofs[msg.sender] = EncryptedProof({
            user: msg.sender,
            data: _data,
            verified: false
        });
        emit ProofSubmitted(msg.sender);
    }

    // Demo verification function: sets verified = true
    // In real FHEVM, computation runs on encrypted data
    function verifyProof(address _user, bool result) external {
        EncryptedProof storage p = proofs[_user];
        require(p.user != address(0), "No proof found");
        p.verified = result;
        emit ProofVerified(_user, result);
    }

    function isVerified(address _user) external view returns (bool) {
        return proofs[_user].verified;
    }
}
