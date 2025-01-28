// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/StakeContract.sol";

contract StakeContractTest is Test {
    StakeContract stakeContract;

    function setUp() public {
        stakeContract = new StakeContract();
    }

    function testStake() public {
        stakeContract.stake{value: 200}();
        assert(stakeContract.balanceOf(address(this)) == 200);
    }

    function testStakeUser() public {
        vm.startPrank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        vm.deal(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10 ether);
        stakeContract.stake{value: 1 ether}();
        assert(stakeContract.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) == 1 ether);
    }

    function testUnstakeUser() public {
        vm.startPrank(0x1028303967f763912C539A14919F29f5DFAfFEBC);
        vm.deal(0x1028303967f763912C539A14919F29f5DFAfFEBC, 10 ether);
        stakeContract.stake{value: 10 ether}();
        stakeContract.unStake(10 ether);
        assert(stakeContract.balanceOf(0x1028303967f763912C539A14919F29f5DFAfFEBC) == 0);
    }
}
