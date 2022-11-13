// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GasGolf {
    uint256 public total;

    // 优化1：用 `calldata` 代替`memory`
    function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
        // 优化2: 使用内存变量，将状态变量到载到内存中
        uint256 _total = total;
        uint256 len = nums.length;
        for (uint256 i = 0; i < len; ) {
             // 优化3: 缓存数组元素
            uint256 num = nums[i];
            // 优化4: 短路，如果前一部分条件判断失败，后一部分条件就不用运算了，可以节约gas
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
            unchecked {
                // 优化5: 循环中用 `++i`代替 `i++`
                ++i;
            }
        }
        total = _total;
    }
}
