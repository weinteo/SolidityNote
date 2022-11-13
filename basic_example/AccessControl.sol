// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * 权限控制合约
 */
contract AccessControl {
    event GrantRole(bytes32 indexed role, address indexed account);
    event RevokeRole(bytes32 indexed role, address indexed account);

    mapping(bytes32 => mapping(address => bool)) public roles;

    // 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    // 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 constant USER = keccak256(abi.encodePacked("USER"));

    bytes32 public user = USER; 

    constructor() {
        _grantRole(ADMIN, msg.sender);
    }

    // 函数修改器，授权时进行判断
    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not authorized!");
        _;
    }

    // 授予角色
    function _grantRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    // 授予权限
    function grantRole(bytes32 _role, address _account)
        external
        onlyRole(ADMIN)
    {
        _grantRole(_role, _account);
    }

    // 撤销权限
    function revokeRole(bytes32 _role, address _account)
        external
        onlyRole(ADMIN)
    {
        roles[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }
}
