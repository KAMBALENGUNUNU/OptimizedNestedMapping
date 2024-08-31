# OptimizedNestedMapping

## Project Overview

**OptimizedNestedMapping** is a Solidity smart contract designed to demonstrate the use of nested mappings while focusing on gas optimization and security. The contract allows users to store, retrieve, and clear values associated with their Ethereum address in a nested mapping structure. The key features include:

- **Nested Mapping**: Each address is mapped to a mapping of keys to values, allowing for efficient data storage.
- **Gas Optimization**: The contract is optimized to minimize gas fees, especially during operations like clearing values.
- **Security**: The contract follows Solidity best practices to ensure safety and integrity.
## Features

1. **setValue(uint256 key, uint256 value)**:  
   This function allows users to store a value in the nested mapping under a specific key. The data is stored under the caller's address.

2. **getValue(address user, uint256 key)**:  
   This function retrieves the value stored in the nested mapping for a given user's address and key.

3. **clearValues(uint256[] calldata keys)**:  
   This function allows users to delete values stored under multiple keys for their address, freeing up storage space and optimizing gas fees.
## How It Works

- **Nested Mapping**: The contract uses a nested mapping structure `mapping(address => mapping(uint256 => uint256))` to associate each user's address with a set of key-value pairs.

- **Gas Optimization**:
  - **Minimized Storage Writes**: The `clearValues` function uses the `delete` keyword to remove mappings, which is more gas-efficient than setting values to zero.
  - **Use of `calldata`**: The function parameters use `calldata` instead of `memory` to reduce unnecessary data copying and lower gas costs.

- **Security**:
  - The contract ensures that only the caller can modify or clear their own mappings.
  - The Solidity version `^0.8.0` is used to benefit from built-in overflow checks, reducing the risk of common vulnerabilities.

## Setup and Usage

### 1. Prerequisites

Before testing or deploying the contract, ensure you have the following installed:

- **Node.js and npm**
- **Truffle or Hardhat** (for local testing)
- **Ganache** (for local blockchain simulation)
