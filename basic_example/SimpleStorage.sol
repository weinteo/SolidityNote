// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleStorage {

    // 状态变量存储一个数
    uint public num;

    // 您需要发送交易以写入状态变量
    function set(uint _num) public {
        num = _num;
    }

    // 您可以在不发送事务的情况下从状态变量中读取
    function get() public view returns (uint) {
        return num;
    }
    
}