// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address private _owner;
    uint256 private constant _MAX_SUPPLY = 100000;

    event TokensCreated(address indexed recipient, uint256 amount);
    event TokensDestroyed(address indexed account, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == _owner, "Access restricted to the contract owner");
        _;
    }

    modifier withinMaxSupply(uint256 amount) {
        require(totalSupply() + amount <= _MAX_SUPPLY, "Minting exceeds the maximum supply");
        _;
    }

    constructor(uint256 initialSupply) ERC20("CustomToken", "CTK") {
        _owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }

    function mintTokens(address recipient, uint256 amount) external onlyOwner withinMaxSupply(amount) {
        _mint(recipient, amount);
        emit TokensCreated(recipient, amount);
    }

    function sendTokens(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
        emit TokensDestroyed(msg.sender, amount);
    }
}
