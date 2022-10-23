// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherUnits {
   
    // 1 wei: 1
    uint public oneWei = 1 wei;

    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    // 1 ether: 1000000000000000000
    uint public oneEther = 1 ether;

    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;

}