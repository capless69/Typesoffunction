# CustomToken Smart Contract

CustomToken is an ERC20-compliant token contract built using OpenZeppelin's ERC20 library. This smart contract provides functionality for minting, burning, and transferring tokens while enforcing a maximum supply limit.

## Features
- **Minting Tokens:**  
  - Only the contract owner can mint new tokens.  
  - Minting is limited by a maximum supply of 100,000 tokens.  

- **Burning Tokens:**  
  - Token holders can burn their tokens to reduce the total supply.

- **Transferring Tokens:**  
  - Fully supports standard ERC20 token transfers between accounts.

## Contract Details
- **Token Name:** CustomToken  
- **Token Symbol:** CTK  
- **Maximum Supply:** 100,000 CTK  
- **Initial Supply:** Configurable during deployment.  

## Functions

### `constructor(uint256 initialSupply)`  
Initializes the contract by minting an initial supply of tokens to the deployer's address.  

#### Parameters:
- `initialSupply` (*uint256*): The number of tokens to mint upon deployment.  

---

### `mintTokens(address recipient, uint256 amount)`  
Allows the owner to mint new tokens and send them to a specified address.  

#### Modifiers:  
- `onlyOwner`: Restricts function access to the owner.  
- `withinMaxSupply`: Ensures the total supply does not exceed the maximum limit.  

#### Parameters:  
- `recipient` (*address*): The address to receive the minted tokens.  
- `amount` (*uint256*): The number of tokens to mint.  

---

### `sendTokens(address recipient, uint256 amount)`  
Transfers tokens from the caller to a specified recipient.  

#### Parameters:  
- `recipient` (*address*): The address to send the tokens to.  
- `amount` (*uint256*): The number of tokens to transfer.  

---

### `burnTokens(uint256 amount)`  
Allows token holders to burn their own tokens, permanently removing them from circulation.  

#### Parameters:  
- `amount` (*uint256*): The number of tokens to burn.  

---

## Events
- **`TokensCreated(address indexed recipient, uint256 amount)`**  
  Triggered when tokens are minted.  

- **`TokensDestroyed(address indexed account, uint256 amount)`**  
  Triggered when tokens are burned.  

---

## Authors
- **Metacrafter Caps**  

---

## License
This project is licensed under the MIT License. See the `LICENSE.md` file for more details.
