// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract B {
    uint256 public number;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) external payable {
        number = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    // 布局必须和被调用合约B一致
    uint256 public number;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint256 _num) external payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            // 调用被调用合影函数的方法有两种：
            abi.encodeWithSignature("setVars(uint256)", _num)
            // abi.encodeWithSelect(B.setVars.selector, _num)  // 该方式存在编译问题（暂未解决）：encodeWithSelect not found or not visible in abi
        );
        require(success, "delegatecall setVars is failed!");
    }
}
