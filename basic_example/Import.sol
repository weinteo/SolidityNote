// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ForImport.sol";

// import symbol1 as alias symbol2
import {Unauthorized, add as func, Point} from "./ForImport.sol";

// 可以通过复制 url 从 GitHub 导入
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";

contract Import {
    Foo public foo = new Foo();

    function getFooName() public view returns (string memory) {
        return foo.name();
    }

    function invokeAdd(uint256 x, uint256 y) public pure returns (uint256) {
        return add(x, y);
    }
}
