// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Fallback {
    event Log(string func, uint256 gas);

    // fallback函数必须被声明为external
    fallback() external payable {
        // send/transfer（将 2300 gas 转发到这个函数）； call（转发所有的gas）
        emit Log("fallback", gasleft());
    }

    // receive是当 msg.data 为空时触发的fallback的变体
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // 获取余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
