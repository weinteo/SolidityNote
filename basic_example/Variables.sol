// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Variables {

    // 状态变量：声明在方法之外的，它会存储到区块链中
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        // 本地变量：声明在方法内的，它不会存储到区块链中
        uint i = 456;

        // 全局变量：提供有关区块链的信息
        uint timestamp = block.timestamp; // 当前区块时间戳
        address sender = msg.sender; // 地址调用者
    }
}