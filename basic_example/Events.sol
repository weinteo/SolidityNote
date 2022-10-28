// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    event Log(address indexed sender, string message);
    event AnotherLog();
    
    // note：这是个写入操作，改变了链上的数据，不能使用view/pure标记
    function test() public {
        emit Log(msg.sender, "Hello Solidity!");
        emit AnotherLog();
    }

    // 一个event中 indexed 标记的变量最多只能有三个
    event IndexLog(address indexed from, address indexed to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit IndexLog(msg.sender, _to, message);
    }
}