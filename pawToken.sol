// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract pawToken is ERC20, Ownable {
    //MergeCoin
    constructor() ERC20("MONKEYPAW", "PAW") public {}
    
    //// I need to fix this public / only owner thing
    
    function mint(address _account, uint256 _amount) public {
     _mint(_account, _amount);
   }
}
