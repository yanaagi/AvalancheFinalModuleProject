# AvalancheFinalModuleProject

## Overview

DegenToken is an Ethereum-based smart contract that implements a custom ERC-20 token called "Degen" (DGN). This contract also includes functionality for managing and redeeming in-game items using the Degen tokens.

## Features

1. **ERC-20 Token**: DegenToken extends the standard ERC-20 token, providing the basic functionalities of transferring, minting, and burning tokens.

2. **Game Items**: The contract includes a collection of in-game items, each with a name, price, and initial supply. Users can redeem these items using their Degen tokens.

3. **Ownership Control**: The contract is owned by an address, and only the owner can perform certain actions such as minting new tokens and adding new game items.

4. **Redeeming Game Items**: Users can redeem in-game items by specifying the item index they want to redeem. The contract verifies if the item is in stock and deducts the required tokens from the user's balance.

5. **Query Functions**: There are various read-only functions to query the contract's state, including checking balances, listing all game items, and getting detailed information about a specific game item.

## Getting Started

1. **Contract Deployment**: Deploy the `DegenToken` contract on the Ethereum blockchain using a development environment like Remix or Truffle.

2. **Minting Tokens**: After deployment, the contract owner can mint new Degen tokens using the `mint` function.

3. **Adding Game Items**: The contract owner can add new game items using the `createGameItem` function, specifying the item name, price, and initial supply.

4. **Redeeming Game Items**: Users can redeem game items using the `redeemTokens` function, providing the item index they want to redeem.

5. **Interacting with the Contract**: Users can transfer tokens, check balances, and query information about game items using the provided functions.

## Smart Contract Functions

- `createGameItem`: Add a new game item to the collection (Owner only).

- `mint`: Mint new Degen tokens (Owner only).

- `burnTokens`: Burn Degen tokens from the sender's balance.

- `transferTokens`: Transfer Degen tokens to another address.

- `redeemTokens`: Redeem a game item by its index.

- `checkBalance`: Check the token balance of an account.

- `getGameItemCount`: Get the total count of available game items.

- `getGameItem`: Get information about a specific game item.

- `listAllGameItems`: List all available game items.


