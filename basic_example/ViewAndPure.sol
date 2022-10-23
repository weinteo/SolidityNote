// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ViewAndPure {
    uint public x = 1;

    // 不能写状态变量
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // 不能读写状态变量
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}