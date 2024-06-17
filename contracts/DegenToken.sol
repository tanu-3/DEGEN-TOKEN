// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20,  {

    constructor() ERC20("Degen", "DGN") {}

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
    }
        function decimals() override public pure returns (uint8){
            return 0;
    }
    function getBalance() external view returns (uint256){
        return this.balance0f(msg.sender);
    }
    function transferTokens(address _receiver, uint256 _value)external{
        require(balance0f(msg.sender) >=_value, "You do not have enough Degen tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }
    function burnTokens(uint 256 _value) external{
        require(balance0f(msg.sender) >=_value, "You do not have enough Degen Tokens");
         _burn(msg.sender, _value);
    }
    function redeemTokens(uint256 _value) external{
        address storeAddress = 0xstoreAddress;
        require(balance0f(msg.sender) >=_value,"You do not have enough tokens to redeem");
        emit redeemTokens(msg.sender, storeAddress,_value);
    }
    
    function checkBalance(address account) external view returns (uint256){
        return balanceOf(account);
    }
}
