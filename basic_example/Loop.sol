// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Loop {

    // pure修饰的函数不能改也不能读状态变量，否则编译通不过。
    function loop() public pure{
        // for loop
        for(uint i = 0; i < 10; i++){
            if(i == 3){
                continue;
            }
            if(i == 5){
                break;
            }
        }
        // while
        uint j;
        while(j < 10){
            j++;
        }
    }
    
}