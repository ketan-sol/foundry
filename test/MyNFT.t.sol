// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "../src/MyNFT.sol";

contract ContractTest is Test {
    MyNFT public nft;
    address addr1 = address(0x1);
    address addr2 = address(0x2);

    function testMint() public {
        nft = new MyNFT();
        nft.mint(addr1, 1);
        address owner = nft.ownerOf(1);
        assertEq(addr1, owner);
        emit log_named_address("nft minted at address:", owner);
    }

    function testTransfer() public {
        nft = new MyNFT();
        nft.mint(addr1, 1);
        vm.startPrank(addr1);
        nft.safeTransferFrom(addr1, addr2, 1);
        address owner = nft.ownerOf(1);
        assertEq(addr2, owner);
        emit log_named_address("nft transferred to address:", owner);
    }

    function testBalance() public {
        nft = new MyNFT();
        nft.mint(addr1, 1);
        nft.mint(addr1, 2);
        nft.mint(addr1, 3);
        nft.mint(addr1, 4);
        nft.mint(addr1, 5);
        uint256 balance = nft.balanceOf(addr1);
        assertEq(balance, 5);
        emit log_named_uint("balance of addr1:", balance);
    }

    function testBurn() public {
        nft = new MyNFT();
        nft.mint(addr1, 1);
        vm.startPrank(addr1);
        vm.expectRevert("not owner");
        nft.burn(1);
    }
}
