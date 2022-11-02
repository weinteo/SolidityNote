// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 函数选择器允许您根据函数名称和每个输入参数的类型执行函数的动态调用
contract FunctionSelector {
    // 以下是函数选择器的计算方式，`calldata` 的前4个字节指定调用哪个函数，这 4 个字节称为函数选择器。
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}