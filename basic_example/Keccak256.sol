// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HashFunction {
    function hash(
        string memory _text,
        uint256 _num,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    // hash碰撞
    function collision(string memory _text, string memory _anotherText)
        public
        pure
        returns (bytes32)
    {
        // 使用encodePacked会出现碰撞，不同的值得到相同的结果，比如：
        // encodePacked(AA, ABBB) -> AAABBB
        // encodePacked(AAA, BBB) -> AAABBB
        return keccak256(abi.encodePacked(_text, _anotherText));
    }
}

contract GuessTheMagicWord {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer; // Magic word is "Solidity"
    }
}
