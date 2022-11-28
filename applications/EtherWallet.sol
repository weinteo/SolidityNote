// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherWallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(owner == msg.sender, "caller not sender!");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
