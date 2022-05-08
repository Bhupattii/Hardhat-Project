// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.5.0 <0.9.0;

import "hardhat/console.sol";

contract Token {
    string public name = "hardhat token";
    string public symbol = "HHT";
    uint public totalSupply = 10000;

    address public owner;

    mapping (address => uint256) balances;

    constructor(){
        balances[msg.sender]=totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint amount) external {
        console.log("**Sender balance is % token**", balances[msg.sender]);
        console.log("**Sender is sending %s tokens to %s address**", amount, to);

        require (balances[msg.sender]>= amount, "Not enough tokens");
        balances[msg.sender]-=amount; //  balances[msg.sender] =  balances[msg.sender]-amount;
        balances[to]+=amount;
    }

    function balanceOf(address account) external view returns(uint) {
        return balances[account];
    }
}