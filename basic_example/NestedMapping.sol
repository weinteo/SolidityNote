// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract NestedMapping {

    // 嵌套映射（从地址映射到另一个映射）
    mapping(address => mapping(uint => bool)) public nested;
    
    function get(address _addr1, uint _i) public view returns (bool){
        // 您可以从嵌套映射中获取值，即使没有初始化
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public{
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public{
        delete nested[_addr1][_i];
    }
    
}