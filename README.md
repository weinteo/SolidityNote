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

### 14.Enum

`Solidity` 支持可枚举，它们对于建模选择和跟踪状态很有用。默认值是列出的第一个元素

```solidity
enum Status {
  Pending,
  Shipped,
  Accepted,
  Rejected,
  Canceled
}
```

枚举可以在合约之外声明，如果在合约外部声明的话，需要在合约中导入枚举：

```solidity
import "./EnumDeclaration.sol";
```

### 15.Structs

您可以通过创建结构来定义自己的类型，它们对于将相关数据分组在一起很有用，结构可以在合同之外声明并在另一个合同中导入。

```solidity
struct Todo {
   string text;
   bool completed;
}
```

### 16.Data Locations（数据存储位置）

变量被声明为` storage`、`memory` 或` calldata` 以明确指定数据的位置。

- storage：状态变量（存储在区块链上），类似全局变量的概念。
- memory：内存变量中，只在函数内存在，类似局部变量。
- calldata：和memory类似，但只能用在输入参数中，多函数参数传递使用，可以节约gas。

```solidity
function f() public {
    MyStruct storage myStruct = myStructs[1];
    myStruct.foo = 111;  // 全局修改

    MyStruct memory myMemStruct = myStructs[0];
    myMemStruct.foo = 123; // 局部修改，只在函数内生效
}

function h(uint256[] calldata _arr) external {
    // do something with calldata array
}
```

### 17.Function

有几种方法可以从函数返回输出，公共函数不能接受某些数据类型作为输入或输出。

- 可以返回多个值

- 可以使用数组作为输入

- 不能使用 map 作为输入或输出

```solidity
function named() public pure returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        return (1, true, 2);
    }
```

可以通过`key-value`的形式给参数赋值，这样可以忽略原有的参数顺序

 ```solidity
 function callFuncWithKeyValue() external pure returns (uint){
     return someFuncWithManyInputs({a: address(0), b: true, c: "c", x: 1, y: 2, z: 3});
 }
 
 function someFuncWithManyInputs(
       uint256 x,
       uint256 y,
       uint256 z,
       address a,
       bool b,
       string memory c
   ) public pure returns (uint256) {}
 ```

### 18.View and Pure Functions

`Getter` 函数可以声明为` view` 或` pure`：

- pure：纯函数声明，不能够读也不能写状态变量，只能拥有局部变量，意味着不对链上数据做操作。
- view：不能修改状态变量

### 19.Error

错误将撤消事务期间对状态所做的所有更改，并退回`gas`费用，您可以通过调用`require`、`revert` 或` assert` 来引发错误：

- require：用于在执行之前验证输入和条件。
- revert：是不能使用表达式的，需要用判断语法，它和`require`相反
- assert：用于检查不应该为`false`的代码，断言失败可能意味着存在错误。

自定义错误可以节约`gas`：

```solidity
error InsufficientBalance(uint balance, uint withdrawAmount);
```

### 20.Function Modifier（函数修改器）

`modifier` 是可以在函数调用之前和/或之后运行的代码。其中`_;`表示运行函数的部分，然后执行完在回来继续执行后面的代码。

好处：把一些验证代码抽出来复用

```solidity
modifier validAddress(address _addr) {
    require(_addr != address(0), "Not valid address");  // 1
    _;
    // 3
}
 
 function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
    owner = _newOwner;  // 2
 }
```

### 21.Event（事件）

事件是记录当前事件智能合约运行状态的方法，但它不会存储到状态变量上。

使用`emit`发射，事件会就汇报到交易记录到`logs`里，然后也会体现到区块链浏览器上。

使用`indexed`标记过的索引变量，就可以在链外查询了（可以用一些工具查询索引变量报出的事件）。一个`event`最多只能有3个有索引的变量。

```solidity
event IndexLog(address indexed from, address indexed to, string message);
function sendMessage(address _to, string calldata message) external {
    emit IndexLog(msg.sender, _to, message);
}
```

### 22.Constructor（构造函数）

构造函数只会在合约部署的时候执行一次，用来初始化变量。

```solidity
contract Constructor{
    address public owner;
    string public name;
    
    constructor(string memory _name){
        owner = msg.sender;
        name = _name;
    }
}
```

有两种方法可以使用参数初始化父合约

```solidity
// 第一种方式
contract ChildConstructorA is Constructor("A") {

}

// 第二种方式
contract ChildConstructorB is Constructor {
    string public nameB;
    constructor(string memory _name) Constructor(_name){
        nameB = _name;
    }
}
```

### 23.Inheritance（继承）

使用 `is 关键字`继承其他合约。

`virtual`关键字表示该函数可以被重写的。

` override`关键字表示覆盖父函数的函数。

```solidity


contract B is A {
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}

contract D is B, C {
    function foo() public pure override(B, C) returns (string memory){
        return super.foo();  // return C 因为C是函数foo()的最右边的父合约
    }
}


```

`Solidity `支持多重继承，但要按照规则顺序书写继承代码：从最基础的到派生的顺序来写

```solidity
// 继承必须从“最基类”到“最派生”排序。如果交换 A 和 B 的顺序会抛出编译错误。因为A是最基的类，所以必须放前面
contract F is A, B{
    function foo() public pure override(A, B) returns (string memory){
        return super.foo(); // ç B
    }
}
```

### 24.Shadowing Inherited State Variables（隐藏继承状态变量）

与函数不同，状态变量不能在子合约中重新声明来覆盖。正确覆盖继承的状态变量？

```solidity
contract A {
    string public name = "Contract A";
}

contract B is A {
    // name = "Contract B";   // error way
    constructor(){
        name = "Contract B";  // right way
    }
}
```

### 25.Calling Parent Contracts（调用父合约）

可以直接调用父合约，也可以使用关键字`super`。通过使用关键字` super`，所有的直接父合约都会被调用。

```solidity
contract A {
    event Log(string message);

    function foo() public virtual {
        emit Log("A foo");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B foo");
        super.foo();  // 调用父合约
    }
}

contract C is A, B {
    function foo() public virtual override(A, B) {
        emit Log("C foo");
        A.foo();   // 直接调合约
    }
}
```

### 26.Visibility（可见性）

函数和状态变量必须声明它们是否可以被其他合约访问。函数可以声明为：

- private：只能在合约内部访问，不能被外部合约访问，也不能被继承合约访问；
- internal：内部变量、函数可以被继承和内部访问，不可以被外部访问；
- public: 可见范围最大，任何合约都可以访问；
- external：只能在合约外部访问，状态变量不可以为`external`范围；

### 27.Interface（接口）

如果不能直接调用其他合约的源代码，可以通过接口的方式与其他合约进行交互：

- 不能有函数实现
- 可以从其他接口继承
- 所有声明的函数必须是外部的
- 不能声明构造函数和状态变量

```solidity
interface ICounter{
    function count() external view returns (uint);

    function increment() external;
}

// 不知道合约的具体内容，只需要知道合约地址、函数的名称、参数等一些信息就可以调用
contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }
}
```

### 28.Payable

函数和地址可以被声明为`Payable`，表示可以在合约中接收以太币。

```solidity
address payable public owner;
// Payable构造函数可以收到eth
constructor() payable {
    // msg.sender本身没有payable属性，所以需要加上
    owner = payable(msg.sender);
}
// 该函数可将以太币存入该合约
function deposit() public payable {}
```

### 29.Sending Ether（发送Ether）

发送Ether有三种方式：

- `transfer` ：消耗2300 gas， 如果失败就会抛出错误
- `send` ：消耗2300 gas， 会返回结果（returns bool）
- `call` ：消耗所有的gas，返回结果（bool）和数据（data）

接收`Ether`的合约必须至少具有以下功能之一：

- `receive() external payable`
- `fallback() external payable`

如果 `msg.data` 为空，则调用`receive()`，否则调用 `fallback()`

如果 `msg.data` 为空，并且没有`receive()`，就会调用`fallback()`

```solidity
// 发送Eth的合约
contract SendEther {
    constructor() payable {}

    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

// 接收Eth的合约
contract ReceiveEther {
    receive() external payable {}

    fallback() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
```

### 30.fallback（回退函数）

`fallback`是一个不接受任何参数且不返回任何内容的函数。

它在何时执行：

- 调用不存在的函数
- 以太币被直接发送到合约，但` receive()` 不存在或 `msg.data` 不为空；

当通过 `transfer` 或 `send` 调用` fallback` 时，`gas` 限制为` 2300`

```solidity
contract Fallback {
    event Log(string func, uint256 gas);
    // fallback函数必须被声明为external
    fallback() external payable {
        // send/transfer（将 2300 gas 转发到这个函数）； call（转发所有的gas）
        emit Log("fallback", gasleft());
    }
    // Receive 是当 msg.data 为空时触发的
    receive() external payable {
        emit Log("receive", gasleft());
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
```

### 31.Call

`call` 是与其他合约交互的低级函数。

只是通过调用回退函数`fallback`发送以太币时，这是推荐的方法。但是，这不是调用现有函数的推荐方法。

假设合约调用者没有合约接收者的源代码，但我们确实知道合约接收者的地址和要调用的函数，可以使用abi编码的方式调用：

```solidity
// 测试合约接收者的函数foo
function testCallFoo(address payable _addr) public payable {
    // 发送以太币并指定gas
    (bool success, bytes memory data) = _addr.call{
        value: msg.value,
        gas: 5000
    }(abi.encodeWithSignature("foo(string, uint256", "call foo", 123));  // uint一定要写成uint256
}
```

### 32.Delegatecall（委托调用）

`delegatecall` 是一个类似于 `call` 的低级函数。当合约A对合约B执行`delegatecall`时，执行B的代码
使用合约 A 的存储，`msg.sender` 和` msg.value`。

Note：

- 只能使用被调用合约的逻辑来改变委托合约状态变量的值，而不能改变被调用合约的值。
- 委托合约的变量布局必须和被调用合约完全一致。

```solidity
contract B {
    uint256 public number;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) external payable {
        number = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    // 布局必须和被调用合约B一致
    uint256 public number;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint256 _num) external payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "delegatecall setVars is failed!");
    }
}
```

### 33.Function Selector（函数选择器）

调用函数时，`calldata` 的前4个字节指定调用哪个函数，这 4 个字节称为函数选择器。

函数选择器可以让你根据函数名称和每个输入参数的类型执行函数的动态调用。

比如，使用`call` 在地址 `addr` 的合约上执行转账：

```solidity
addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))
```

从 `abi.encodeWithSignature(....) `返回的前 4 个字节是函数选择器。

### 34.Calling Other Contract（调用其他合约）

合约可以通过 2 种方式调用其他合约。最简单的方法就是直接调用它，比如 A.foo(x, y, z)。

调用其他合约的另一种方法是使用低级调用，但不推荐这种方法。

```solidity
contract Callee {
    uint public x;
    uint public value;
    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }
}

contract Caller {
  function setX(Callee _callee,  uint _x) public {
     uint x = _callee.setX(_x);
}

  function setXFromAddress(address _addr, uint _x) public {
     Callee callee = Callee(_addr);
     callee.setX(_x);
  }
}
```

### 35.Contract that Creates other Contracts（合约中创建合约）

其他合约可以使用 new 关键字创建合约。从 0.8.0 开始，`new `关键字通过指定 `salt `选项来支持 `create2` 功能。

```solidity
function createAndSendEther(address _owner, string memory _model)
    public payable {
      Car car = new Car{value: msg.value}(_owner, _model);
      cars.push(car);
}

function create2(
    address _owner,
    string memory _model,
    bytes32 _salt
) public payable {
    Car car = new Car{value: msg.value, salt: _salt}(_owner, _model);
    cars.push(car);
}
```

### 36.Try Catch（异常捕捉）

`try / catch `只能从外部函数调用和合约创建中捕获错误。

```solidity
// 捕捉调用函数异常
function tryCatchExternalCall(uint256 _i) public {
    try foo.myFunc(_i) returns (string memory result) {
        emit Log(result);
    } catch {
        emit Log("external call failed");
    }
}

// 捕捉创建新合约异常
function tryCatchNewContract(address _owner) public {
    try new Foo(_owner) returns (Foo foo) {
        emit Log("Foo created!");
    } catch Error(string memory reason) {
        emit Log(reason);
    } catch (bytes memory reason) {
        emit LogBytes(reason);
    }
}
```

### 37.Import（导入）

可以在 Solidity 中导入本地和外部文件。也可以通过简单地复制 url 从 GitHub 导入

```solidity
import "./ForImport.sol";

import {Unauthorized, add as func, Point} from "./ForImport.sol";

// 可以通过复制 url 从 GitHub 导入
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";
```

### 38.Library（库）

库类似于合约，但不能声明任何状态变量，并且也不能发送以太币。

如果所有库函数都是内部的，则将库嵌入到合约中。否则，必须先部署库，然后在部署合约之前进行链接。

```solidity
library Array {
    function remove (uint[] storage arr, uint index) public {
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    // 使用<using 库 for 类型>的方法，该类型就可以使用库的所有函数功能
    using Array for uint256[];
    uint256[] public arr;
    function testArrayRemove() public {
        for (uint256 i = 0; i < 3; i++) {
            arr.push(i); // 0,1,2
        }
        arr.remove(1); // 0,2
    }
}
```

### 39.ABI Encode

- `abi.encode(...) returns (bytes)`： [**ABI**](https://solidity-cn.readthedocs.io/zh/develop/abi-spec.html#abi) - 对给定参数进行编码
- `abi.encodePacked(...) returns (bytes)`：对给定参数执行 [紧打包编码](https://solidity-cn.readthedocs.io/zh/develop/abi-spec.html#abi-packed-mode)
- `abi.encodeWithSelector(bytes4 selector, ...) returns (bytes)`： 对给定参数进行编码，并以给定的函数选择器作为起始的 4 字节数据一起返回
- `abi.encodeWithSignature(string signature, ...) returns (bytes)`：等价于 `abi.encodeWithSelector(bytes4(keccak256(signature), ...)`

```solidity
abi.encodeWithSignature("transfer(address, uint256)", to, amount);
abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
abi.encodeCall(IERC20.transfer, (to, amount));
```

### 40.ABI Decode

`abi.encode` 将数据编码为字节，`abi.decode` 将字节解码回数据。

```solidity
contract AbiDecode {
    struct MyStruct {
        string name;
        uint256[2] nums;
    }

    function encode(
        uint256 x,
        address addr,
        uint256[] calldata arr,
        MyStruct calldata myStruct
    ) external pure returns(bytes memory){
        return abi.encode(x, addr, arr, myStruct);
    }

    function decode(bytes calldata data)
        external
        pure
        returns (
            uint256 x,
            address addr,
            uint256[] memory arr,
            MyStruct memory myStruct
        )
    {
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
    }
}
```

### 41.Hashing with Keccak256（用 Keccak256 散列）

keccak256 计算输入的 Keccak-256 哈希。一些用例是：

- 从输入创建确定性唯一 ID
- 提交-显示方案
- 紧凑的加密签名（通过签名散列而不是更大的输入）

```solidity
function hash(
    string memory _text,
    uint256 _num,
    address _addr
) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(_text, _num, _addr));
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

[Solidity develop docs](https://solidity-cn.readthedocs.io/zh/develop/index.html)