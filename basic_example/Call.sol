// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Receiver {
    uint256 public x;

    event Received(address caller, uint256 amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x)
        public
        payable
        returns (uint)
    {
        emit Received(msg.sender, msg.value, _message);
        x = _x + 1;
        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    // 假设合约调用者没有合约接收者的源代码，但我们确实知道合约接收者的地址和要调用的函数
    function testCallFoo(address payable _addr) public payable {
        // 发送以太币并指定gas
        (bool success, bytes memory data) = _addr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("foo(string, uint256)", "call foo", 123));
        emit Response(success, data);
    }

    // 调用不存在的函数会触发fallback
    function testCallDoseNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        emit Response(success, data);
    }
}
