# DEGEN TOKEN

In this, we have to create a degen token and also use ``` minting function```, ```transfer function```, ```burn functions``` and ```checkbalance functions```.

## Description

In this, it is ethereum based ERC2o token that will implement all above functions like  minting tokens means where we have to mint new tokens and give specific address , burning functions for users can burn their tokens,reducing the total supply of token ,transferring tokens to transfer another address.Redeeming tokens where updates user's token card balance.

## Getting Started

### Executing program

To run code, follow these steps:
1. open my project
2. copy Degen.sol into remix and deploy.
3. After deploying copy the address of contract and paste in contractAddress inside app.js, and copy abi and paste in contractABI inside same app.js.
4. Now open index.html in browser and start interacting.
```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    struct Tokencards {
        uint A;
        uint B;
        uint C;
        }
        
        address public storeAddress;
    
    mapping(address => Tokencards) public userCards;
    
    event TokensRedeemed(address indexed redeemer, address indexed storeAddress, uint256 amount);
    
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
    
        storeAddress = address(0x1234567890AbcdEF1234567890aBcdef12345678);
        } // Default store address}
    
    function setStoreAddress(address _storeAddress) external onlyOwner {
        storeAddress = _storeAddress;
        }
    
    
    function mint(address to, uint256 amount) public onlyOwner {
    require(to != address(0), "Cannot mint to zero address");
    require(amount > 0, "Amount must be greater than zero");
    _mint(to, amount);
}
    function decimals() public pure override returns (uint8) { 
        return 0;
        }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
        }

    function transferTokens(address _receiver, uint256 _amount) external {

        require(balanceOf(msg.sender) >= _amount, "You do not have enough Degen tokens");
        transfer(_receiver, _amount);
        }

    function burnTokens(uint256 _value) external {

        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        _burn(msg.sender, _value);
        }

    function redeemTokens(uint256 _value, uint input) external returns (string memory) {
        
        Tokencards storage userCard = userCards[msg.sender];
   
   if (input == 1) {
    userCard.A++;
    } else if (input == 2) {
        userCard.B++;
        } else if (input == 3) {  
            userCard.C++;
        } else {
             return "Unknown token card";
             }
        require(balanceOf(msg.sender) >= _value, "You do not have enough tokens to redeem");
        
        _burn(msg.sender, _value);

        require(storeAddress != address(0), "Store address is not set");

        emit TokensRedeemed(msg.sender, storeAddress, _value);

        return "Tokens redeemed successfully";
        }

function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
        }
        
```

## Authors

TANU PAL
@Tanu


## License

This project is licensed under the [Metacrafters] License - see the LICENSE.md file for details
