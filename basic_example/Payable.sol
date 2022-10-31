// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Payable {
    address payable public owner;

    // Payable构造函数可以收到eth
    constructor() payable {
        // msg.sender本身没有payable属性，所以需要加上
        owner = payable(msg.sender);
    }

    // 将以太币存入该合约的函数，与一些 Ether 一起调用此函数，该合约的余额会自动更新。
    function deposit() public payable {}

    // 用一些以太币来调用这个函数。该函数将抛出一个错误，因为该函数是不可支付的。
    function notPayable() public {}

    function withDraw() public {
        uint256 amount = address(this).balance;
        // 发送所有的eth给owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // 从这个合约转换eth到输入的地址
    function transfer(address payable _to, uint256 _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}
