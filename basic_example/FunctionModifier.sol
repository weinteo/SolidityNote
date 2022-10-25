// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FunctionModifier {
   
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // 这个modifier为了检查调用者是合约的所有者
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // 下划线是一个特殊的字符，只用在一个modifier函数，它告诉 Solidity 执行代码的其余部分
        _;
    }

    // modifiers可以接受输入，这个modifier检查地址不是0地址
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // modifier可以在一个函数之前或之后调用
    // 这个modifier防止一个函数调用函数while它仍在执行中
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
