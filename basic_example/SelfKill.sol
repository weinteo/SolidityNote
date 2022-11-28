// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
 * 自毁合约：通过自带的selfdestruct函数可以实现
 * 1.自我销毁合约
 * 2.强制发送主币到另外一个地址
 */
contract SelfKill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    // 测试方法：如果合约销毁，则不会有返回值
    function testCall() external pure returns (uint256) {
        return 123;
    }
}

/*
 * 助手合约：用来接收销毁合约后的主币
 */
contract Helper {
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function kill(SelfKill _kill) external {
        _kill.kill();
    }
}
