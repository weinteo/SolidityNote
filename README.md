## SolidityNote

learn solidity note

### solidity基本语法学习

根据`example`来学习；from：https://solidity-by-example.org/hello-world/

#### 1.HelloSolidity
#### 2.FistAPP

#### 3.Primitive Data Types（原始数据类型）

原始数据类型包含：

- `boolean`: 取值为常量值`true`和`false`，
- `uint`: 代表无符号整数，意思是非负整数，有不同的尺寸可供选择，从 `uint8 `到` uint256`
- `int`: 类型允许使用负数。与 uint 一样，从 `int8` 到` int256` 都有不同的范围可用
- `address`：表示地址，以太坊地址的长度，大小20个字节，160位

区分`uint`和`int`的取值范围，`uint `是 `uint256` ， `int `就是 `int256`

```
uint8   ranges from 0 to 2 ** 8 - 1
uint16  ranges from 0 to 2 ** 16 - 1
...
uint256 ranges from 0 to 2 ** 256 - 1


int128 ranges from -2 ** 127 to 2 ** 127 - 1
int256 ranges from -2 ** 255 to 2 ** 255 - 1
```

这些类型的变量未赋值时是有默认值的

```solidity
bool public defaultBoo; // false
uint public defaultUint; // 0
int public defaultInt; // 0
address public defaultAddr; // 0x0000000000000000000000000000000000000000
```


### remix集成github的project

1. 安装插件DGIT
2. Github上生成Token
3. 将生成的Token配置到Remix的Setting内的GitHub Access Token
4. 使用DGIT，clone Github上的项目到Remix中

可参考：[GitHub in Remix IDE](https://medium.com/remix-ide/github-in-remix-ide-356de378f7da)

### 学习资源

[区块链技术-智能合约Solidity编程语言](https://solidity.tryblockchain.org/index.html)