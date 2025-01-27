// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BibekCoin is ERC20 { 
    address addressOfClient;
    
    constructor() ERC20("BibekCoin", "BIB") {

    }

    function mint(address _to, uint _value) public {
        _mint(_to, _value);
    }

}