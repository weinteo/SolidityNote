// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }

}

interface ICounter{
    function count() external view returns (uint);

    function increment() external;
}

// 不知道合约的具体内容，只需要知道函数的名称、参数等一些信息就可以调用
contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }
}