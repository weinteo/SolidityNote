// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PrimitivesDataType {

    bool public boo = true;

    /*
     uint 代表无符号整数，意思是非负整数，有不同的尺寸可供选择
     uint8   ranges from 0 to 2 ** 8 - 1
     uint16  ranges from 0 to 2 ** 16 - 1
     ...
     uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint 是 uint256 的别名

    /*
     int 类型允许使用负数。与 uint 一样，从 int8 到 int256 都有不同的范围可用
     int128 ranges from -2 ** 127 to 2 ** 127 - 1
     int256 ranges from -2 ** 255 to 2 ** 255 - 1
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is same as int256

    // int类型的最大值和最小值
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
     数据类型 byte 表示一个字节序列。Solidity 提供了两种字节类型：
     - 固定大小的字节数组
     - 动态大小的字节数组
     Solidity 中的术语字节表示一个动态的字节数组。它是 byte[] 的简写。
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    // 未赋值的变量有一个默认值
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}