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

#### 4.Variables（变量）

存在三种变量：

- 状态变量：声明在方法之外的，它会存储到区块链中
- 本地变量：声明在方法内的，它不会存储到区块链中
- 全局变量：提供有关区块链的信息

```solidity
// 全局变量：提供有关区块链的信息
uint timestamp = block.timestamp; // 当前区块时间戳
```

#### 5.Constants（常量）

常数是无法修改的变量，它们的值是硬编码的，使用常量可以节省 gas 成本。

常量的编码约定为大写字母。

```solidity
address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
```

#### 6.Immutable(不可变)

不可变变量就像常量。和常量不同的是，不可变变量的值可以在构造函数中设置，但之后也是不能修改的。

#### 7.Reading and Writing to a State Variable（状态变量读和写）

要写入或更新状态变量，您需要发送交易。另一方面，您可以免费读取状态变量，无需任何交易费用。

#### 8.Ether and Wei

交易是用以太币支付的。wei是基本单位（1wei = 1），1 以太币等于 10^18 wei

```solidity
 // 1 wei: 1
 uint public oneWei = 1 wei;
 // 1 ether: 1000000000000000000
 uint public oneEther = 1 ether;
```

#### 9.Gas

你需要为一笔交易支付多少以太币？

需要 （支付的 gas 花费 * gas price 的以太币数量）：

其中`gas`是计算单位，消耗的`gas`是交易中使用的`gas总量`，`gas价格`是您愿意为每种`gas`支付多少以太币。

> note: 具有较高`gas价格`的交易具有更高的优先级被包含在一个块中，未用完的`gas`将被退还。

##### Gas Limit

您可以花费的汽油量有 2 个上限：

- 气体限制（您愿意为交易使用的最大气体量，由您设置）

- 区块气体限制（区块中允许的最大气体量，由网络设置）

[Gas是什么?](https://www.youtube.com/watch?v=7Ygb02sfgXk)

### 10.If/Else

`Solidity` 支持条件语句` if、else if` 和` else`，也支持 `if / else `语句的简写方式，通过”？”运算符（三元运算符）

```solidity
function ternary(uint _x) public pure returns (uint){
    // if (_x < 10) {
    //     return 1;
    // }
    // return 2;

    // if / else 语句的简写方式，”？”运算符称为三元运算符
    return _x < 10 ? 1 : 2;
}
```

### 11.For and While Loop

`Solidity` 支持` for`、`while` 和` do while `循环。不要编写无界循环，因为这可能会达到 `gas `限制，从而导致您的交易失败。所以很少使用 `while `和 `do while` 循环。

### 12.Mapping（映射）

映射是使用语法映射（`keyType` =>` valueType`）创建的。`keyType` 可以是任何内置值类型、字节、字符串或任何协定。`valueType` 可以是任何类型，包括另一个映射或数组。映射是不可迭代的。

```solidity
mapping(address => uint) public myMap;
myMap[_addr]
myMap[_addr] = _i
```

#### NestedMapping（嵌套映射）

嵌套映射（从地址映射到另一个映射）

```solidity
mapping(address => mapping(uint => bool)) public nested;
function get(address _addr1, uint _i) public view returns (bool){
    return nested[_addr1][_i];
}

function set(address _addr1, uint _i, bool _boo) public{
    nested[_addr1][_i] = _boo;
}

function remove(address _addr1, uint _i) public{
    delete nested[_addr1][_i];
}
```

### 13.Array

数组可以具有编译时固定大小或动态大小。

```solidity
uint256[] public arr;
uint256[] public arr2 = [1, 2, 3];
// 固定大小的数组，所有元素初始化为 0
uint256[10] public myFixedSizeArr;
// 在内存中创建数组，只能创建固定大小
uint[] memory a = new uint[](5);

// 从数组中删除最后一个元素，会将数组长度减少 1
function pop() public {
    arr.pop();
}
// 删除不会更改数组长度。它将索引处的值重置为其默认值，这种情况下就是为0
function remove(uint index) public{
    delete arr[index];
}
```

### remix集成github的project

1. 安装插件DGIT
2. Github上生成Token
3. 将生成的Token配置到Remix的Setting内的GitHub Access Token
4. 使用DGIT，clone Github上的项目到Remix中

可参考：[GitHub in Remix IDE](https://medium.com/remix-ide/github-in-remix-ide-356de378f7da)

### 学习资源

[区块链技术-智能合约Solidity编程语言](https://solidity.tryblockchain.org/index.html)