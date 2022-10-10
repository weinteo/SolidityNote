// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Array {
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    // 固定大小的数组，所有元素初始化为 0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity 可以返回整个数组。但是这个函数应该避免, 长度可以无限增长的数组。
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    // 从数组中删除最后一个元素，会将数组长度减少 1
    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint){
        return arr.length;
    }

    // 删除不会更改数组长度。它将索引处的值重置为其默认值，这种情况下就是为0
    function remove(uint index) public{
        delete arr[index];
    }

    function examples() pure external{
        // 在内存中创建数组，只能创建固定大小
        uint[] memory a = new uint[](5);
        a[1] = 1;
    }

}
