// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Signature Verification

How to Sign and Verify // 如何签名和验证
# Signing 签名
1. Create message to sign // 创建签名的message
2. Hash the message       // 对message进行hash
3. Sign the hash (off chain, keep your private key secret) // 签名这个hash

# Verify
1. Recreate hash from the original message  // 从原始消息重新创建哈希
2. Recover signer from signature and hash   // 从签名和哈希中恢复签名者
3. Compare recovered signer to claimed signer // 将恢复的签名者与声明的签名者进行比较
*/

contract VerifySignature {
    // 1.获取签名的message
    function getMessageHash(
        string memory _message
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message)); // hash运算，返回32位的hash值
    }

    // 2.对message的hash再进行一次hash，一次hash在数学界有破解的可能性了，为了保证安全性，再加上一个字符串进行hash
    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    // 3.验证签名
    function vertify(
        address _signer,
        string memory _message,
        bytes memory signature
    ) public pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }

    function recoverSigner(
        bytes32 _ethSignedMessageHash,
        bytes memory _signature
    ) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature); // 签名的bytes是通过r s v拼接起来的
        return ecrecover(_ethSignedMessageHash, v, r, s); // 智能合约自带的函数，恢复签名
    }

    // 是否是固定的算法，底层有实现？
    function splitSignature(bytes memory sig)
        public
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(sig.length == 65, "invaild signature length"); // 65 = 32 + 32 + 1
        // 通过内联汇编进行分割，
        assembly {
            r := mload(add(sig, 32))   // 32位代表跳过32位的长度获取跳过sig32位之后的的32位
            s := mload(add(sig, 64)) // r占用了32位，所以要s跳过32+32 = 64
            v := byte(0, mload(add(sig, 96)))  // v要跳过64位，byte0 就可以获取一位的uint8
        }
    }
}
