// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Gas {

    uint public i = 0;

    // 用完您发送的所有气体会导致您的交易失败
    // 状态更改已撤消，消耗的气体不予退还
    function forever() public {
        // 运行一个循环，直到所有的Gas都用完，交易就失败了
        while (true) {
            i += 1;
        }
    }
}
