// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract IfElse {

    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }    
    }

    function ternary(uint _x) public pure returns (uint){
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // if / else 语句的简写方式，”？”运算符称为三元运算符
        return _x < 10 ? 1 : 2;
    }

}