// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/BibekCoin.sol";

contract BibekCoinTest is Test {
    BibekCoin bibekCoin;

    function setUp() public {
        bibekCoin = new BibekCoin(address(this));
    }

    function testTotalSupply() public view {
        assert(bibekCoin.totalSupply() == 0);
    }

    function testFailMint() public {
        vm.startPrank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bibekCoin.mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);
    }

    function testMint() public {
        bibekCoin.mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);
        assert(bibekCoin.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) == 10);
    }


    function testChangeStakingContract() public {
        bibekCoin.updateStakingContract(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        vm.startPrank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        bibekCoin.mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);
        assert(bibekCoin.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) == 10);
    }
}
