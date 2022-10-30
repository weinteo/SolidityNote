
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A{
    function foo() public pure virtual returns (string memory){
        return "A";
    }
}

contract B is A {
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}

contract C is A {
    function foo() public pure virtual override returns (string memory){
        return "C";
    }
}

contract D is B, C {
    function foo() public pure override(B, C) returns (string memory){
        return super.foo();  // return C;因为C是函数foo()的最右边的父合约
    }
}

contract E is C, B {
    function foo() public pure override(C, B) returns (string memory){
        return super.foo();  // return B; 因为B是函数foo()的最右边的父合约
    }
}

// 继承必须从“最基类”到“最派生”排序。如果交换 A 和 B 的顺序会抛出编译错误。
contract F is A, B{
    function foo() public pure override(A, B) returns (string memory){
        return super.foo(); // return B
    }
}
