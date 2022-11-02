// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
    event Log(string message);

    function foo() public virtual {
        emit Log("A foo");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B foo");
        super.foo();
    }
}

contract C is A, B {
    function foo() public virtual override(A, B) {
        emit Log("C foo");
        A.foo();   // 直接调合约
    }
}
