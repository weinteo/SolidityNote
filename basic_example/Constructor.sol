// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Constructor{
    
    address public owner;
    string public name;
    
    constructor(string memory _name){
        owner = msg.sender;
        name = _name;
    }
}

// 有两种方法可以使用参数初始化父合约

// 第一种方式
contract ChildConstructorA is Constructor("A") {

}

// 第二种方式
contract ChildConstructorB is Constructor {
    string public nameB;
    constructor(string memory _name) Constructor(_name){
        nameB = _name;
    }
}