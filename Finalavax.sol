// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable {
    struct GameItem {
        string name;
        uint256 price;
        uint256 totalSupply;
    }

    GameItem[] public gameItems;

    constructor() ERC20("Degen", "DGN") {
        createGameItem("Excalibur", 100, 10);
        createGameItem("Shield", 50, 30); 
        createGameItem("Boots", 10, 50);  
        createGameItem("Armor", 20, 35);  
    }

    function createGameItem(string memory _name, uint256 _price, uint256 _initialSupply) internal onlyOwner {
        gameItems.push(GameItem(_name, _price, _initialSupply));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient balance");
        _burn(msg.sender, _value);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(_receiver != address(0), "Invalid address");
        require(balanceOf(msg.sender) >= _value, "Insufficient balance");
        _transfer(msg.sender, _receiver, _value);
    }

    event RedeemAttempt(address indexed sender, uint256 itemIndex, uint256 balance);

    function redeemTokens(uint256 _itemIndex) external payable {
        emit RedeemAttempt(msg.sender, _itemIndex, balanceOf(msg.sender)); // Debugging line
        require(_itemIndex < gameItems.length, "Invalid item index");
        GameItem storage item = gameItems[_itemIndex];
        require(item.totalSupply > 0, "Item out of stock");
        uint256 itemPrice = item.price;

        _burn(msg.sender, itemPrice);
        item.totalSupply--; // Reduce the total supply of the redeemed item
    }

    function checkBalance(address _account) external view returns (uint256) {
        return balanceOf(_account);
    }

    function getGameItemCount() external view returns (uint256) {
        return gameItems.length;
    }

    function getGameItem(uint256 _itemIndex) external view returns (string memory name, uint256 price, uint256 totalSupply) {
        require(_itemIndex < gameItems.length, "Invalid item index");
        GameItem storage item = gameItems[_itemIndex];
        return (item.name, item.price, item.totalSupply);
    }

    function listAllGameItems() external view returns (GameItem[] memory) {
        return gameItems;
    }
}
