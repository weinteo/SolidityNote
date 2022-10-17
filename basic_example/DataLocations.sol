// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;
    struct MyStruct {
        uint256 foo;
    }
    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        _f(arr, map, myStructs[1]);

        // mapping中获取一个struct
        MyStruct storage myStruct = myStructs[1];
        myStruct.foo = 111; // 全局修改

        // 内存中创建一个
        MyStruct memory myMemStruct = myStructs[0];
        myMemStruct.foo = 123; // 局部修改，函数内生效
    }

    function getStruct(uint256 i) public view returns (MyStruct memory) {
        return myStructs[i];
    }

    function getFoo(uint256 i) public view returns (uint256) {
        return myStructs[i].foo;
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
    }
}
