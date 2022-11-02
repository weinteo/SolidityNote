// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
    string public name = "Contract A";
}

contract B is A {
    constructor(){
        name = "Contract B";
    }
}

// 错误写法
// contract C is A {
//     name = "Contract C";  
// }