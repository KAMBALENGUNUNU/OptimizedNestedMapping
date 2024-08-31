// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OptimizedNestedMapping {

    // Nested mapping: mapping from an address to another mapping
    mapping(address => mapping(uint256 => uint256)) private nestedMap;

    // Event to log updates
    event ValueSet(address indexed user, uint256 indexed key, uint256 value);

    /**
     * @dev Sets a value in the nested mapping.
     * @param key The key to set in the nested mapping.
     * @param value The value to set in the nested mapping.
     */
    function setValue(uint256 key, uint256 value) external {
        nestedMap[msg.sender][key] = value;
        emit ValueSet(msg.sender, key, value);
    }

    /**
     * @dev Gets a value from the nested mapping.
     * @param user The user address to look up.
     * @param key The key to get from the nested mapping.
     * @return The value stored in the nested mapping.
     */
    function getValue(address user, uint256 key) external view returns (uint256) {
        return nestedMap[user][key];
    }

    /**
     * @dev Optimized function to clear all mappings for the sender.
     * This function reduces the need to loop over mappings.
     * @param keys The array of keys to clear in the nested mapping.
     */
    function clearValues(uint256[] calldata keys) external {
        for (uint256 i = 0; i < keys.length; i++) {
            delete nestedMap[msg.sender][keys[i]];
        }
    }
}
