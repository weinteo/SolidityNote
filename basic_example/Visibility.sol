// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Base {

    // 合约内部访问
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // 合约内部和继承这个合约的可以访问
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // 合约内部、继承合约、其他合约均可以访问
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // 只能其他合约调用
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // 合约内是不可以访问external函数的
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // 状态变量不可以为external范围
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // 继承是不可以访问private函数和状态变量的
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // 内部函数能被孩子合约调用
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
