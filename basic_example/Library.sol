// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library Math {
    function sqrt(uint y) internal pure returns (uint z){
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    function max(uint x, uint y) internal pure returns (uint){
        return x >= y ? x: y;
    }
}

library Array {

    // 数组函数删除索引处的元素并重新组织数组，使它们在元素之间没有间隙
    function remove (uint[] storage arr, uint index) public {
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

}

contract TestArray {

    // 使用<using 库 for 类型>的方法，该类型就可以使用库的所有函数功能
    using Array for uint[];

    uint[] public arr;

    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) {
            arr.push(i);   // 0,1,2
        }

        arr.remove(1);   // 0,2

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }

    function testMax(uint x, uint y) public pure returns (uint) {
        return Math.max(x, y);
    }
}