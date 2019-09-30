# 官方 Swift 风格指南

一定要阅读 [Apple 的 API 设计规范](https://swift.org/documentation/api-design-guidelines/)。

具体的规范细节和附加说明如下。

本指南已于 2018 年 2 月 14 日针对 Swift 4.0 进行了更新。

## 1. 代码格式

- **1.1** 使用 4 个空格代替 1 个`tabs`。
- **1.2** 单行过长会引起阅读不适，每行代码尽量限制在 160 字符内 （ Xcode -> Preferences -> Text Editing -> Page guide at column 设置为 160 将会很有帮助）
- **1.3** 确保每个文件末尾都有一个新行。
- **1.4** 确保任何地方都没有尾随的空格（ Xcode -> Preferences -> Text Editing -> Automatically trim trailing whitespace 加上 Including whitespace-only lines ）。
- **1.5** 不要把左大括号放在新行 — 我们使用 1TBS 风格。

  ```
  class SomeClass {
      func someMethod() {
          if x == y {
              /* ... */
          } else if x == z {
              /* ... */
          } else {
              /* ... */
          }

          /* ... */
      }
  }
  ```

- **1.6** 当为属性、常量、变量、字典的键、函数参数、协议实现或父类书写类型时，不要在冒号`:`前面加上空格。

  ```
  // 指明类型
  let pirateViewController: PirateViewController

  // 字典语法（注意我们左对齐而不是对齐冒号）
  let ninjaDictionary: [String: AnyObject] = [
      "fightLikeDairyFarmer": false,
      "disgusting": true
  ]

  // 生命函数
  func myFunction<T, U: SomeProtocol>(firstArgument: U, secondArgument: T) where T.RelatedType == U {
      /* ... */
  }

  // 调用函数
  someFunction(someArgument: "Kitten")

  // 父类
  class PirateViewController: UIViewController {
      /* ... */
  }

  // 协议
  extension PirateViewController: UITableViewDataSource {
      /* ... */
  }

  ```

- **1.7** 通常，`,` 逗号后面应该有一个空格。

  ```
  let myArray = [1, 2, 3, 4, 5]
  ```

- **1.8** 二元运算符前后都应该有一个空格，比如`+`、`==`或`->`。当然，`(`后面和`)`前面就不要有空格了。

  ```
  let myValue = 20 + (30 / 2) * 3
  if 1 + 1 == 3 {
      fatalError("The universe is broken.")
  }
  func pancake(with syrup: Syrup) -> Pancake {
      /* ... */
  }
  ```

- **1.9** 我们遵循 Xcode 推荐的缩进风格（即按住 CTRL-I 时，代码不再发生变化）。当声明的函数跨越多行时，推荐使用 Xcode 7.3 默认的语法风格。

  ```
  // 针对跨行函数声明，Xcode 添加了缩进
  func myFunctionWithManyParameters(parameterOne: String,
                                  parameterTwo: String,
                                  parameterThree: String) {
      // 对于这种语句，Xcode 缩进到这
      print("\(parameterOne) \(parameterTwo) \(parameterThree)")
  }

  // 针对多行的 `if` 语句增加换行缩进
  if myFirstValue > (mySecondValue + myThirdValue)
      && myFourthValue == .someEnumValue {

      // 这行语句缩进到这
      print("Hello, World!")
  }
  ```

- **1.10** 当调用一个多参数函数时，将每个参数放置有额外缩进的单独行中。

  ```
  someFunctionWithManyArguments(
      firstArgument: "Hello, I am a string",
      secondArgument: resultFromSomeFunction(),
      thirdArgument: someOtherLocalProperty)
  ```

- **1.11** 处理大到足以分成多行的隐式数组或字典时，按照方法、if 语句等语法中大括号的风格使用 `[` 和 `]` 。方法中的闭包也应该用类似的风格处理。

  ```
  someFunctionWithABunchOfArguments(
      someStringArgument: "hello I am a string",
      someArrayArgument: [
          "dadada daaaa daaaa dadada daaaa daaaa dadada daaaa daaaa",
          "string one is crazy - what is it thinking?"
      ],
      someDictionaryArgument: [
          "dictionary key 1": "some value 1, but also some more text here",
          "dictionary key 2": "some value 2"
      ],
      someClosure: { parameter1 in
          print(parameter1)
      })
  ```

- **1.12** 尽可能避免多行语句，推荐使用局部常量或其他方法。

  ```
  // 推荐
  let firstCondition = x == firstReallyReallyLongPredicateFunction()
  let secondCondition = y == secondReallyReallyLongPredicateFunction()
  let thirdCondition = z == thirdReallyReallyLongPredicateFunction()
  if firstCondition && secondCondition && thirdCondition {
      // 做某事
  }

  // 不推荐
  if x == firstReallyReallyLongPredicateFunction()
      && y == secondReallyReallyLongPredicateFunction()
      && z == thirdReallyReallyLongPredicateFunction() {
      // 做某事
  }
  ```

### <a id="测试">测试</a>

## <a href="命名">2. 命名</a>

- **2.1** 在 Swift 中不需要 Objective-C 风格的前缀（比如用 GuybrushThreepwood 代替 LIGuybrushThreepwood）。
- **2.2** 使用 PascalCase 为类型命名（比如 struct 、 enum 、 class 、 typedef 、 associatedtype 等等）。
- **2.3** 对于函数、方法、属性、常量、变量、参数名称、枚举选项，使用 camelCase （首字母小写）。
- **2.4** 实际上，当处理通常全部大写的缩写或其他名称时，代码里用到的任何名称都使用大写。例外情况是，如果这个单词位于以需要用小写开头的名称的开头 —— 在这种情况下，请使用全部小写字母作为首字母缩写词。

  ```
  // 「HTML」是常量名称的开头，所以我们使用小写「html」
  let htmlBodyContent: String = "<p>Hello, World!</p>"
  // 推荐使用 ID 而不是 Id
  let profileID: Int = 1
  // 推荐 URLFinder 而不是 UrlFinder
  class URLFinder {
      /* ... */
  }
  ```

- **2.5** 所有与实例无关的常量都应该用 `static` 修饰。所有这些 `static` 常量都应该放置在他们的 `class` 、 `struct` 或 `enum` 标记过的部分中。 对于有很多常量的类，你应该将拥有类似或相同前缀、后缀 和 / 或者使用情况的常量进行分组。

  ```
  // 推荐
  class MyClassName {
      // MARK: - 常量
      static let buttonPadding: CGFloat = 20.0
      static let indianaPi = 3
      static let shared = MyClassName()
  }

  // 不推荐
  class MyClassName {
      // 不要使用 `k` 前缀
      static let kButtonPadding: CGFloat = 20.0

      // 不用为常量使用命名空间
      enum Constant {
          static let indianaPi = 3
      }
  }
  ```

- **2.6** 对于泛型和关联类型，使用 PascalCase 描述泛型。如果这个单词和它遵循的协议或者它继承的父类冲突，你可以在关联类型或泛型名称后面追加 Type 后缀。

  ```
  class SomeClass<Model> { /* ... */ }
  protocol Modelable {
      associatedtype Model
  }
  protocol Sequence {
      associatedtype IteratorType: Iterator
  }
  ```

- **2.7** 名称应具有描述性的和明确性。

  ```
  // 推荐
  class RoundAnimatingButton: UIButton { /* ... */ }

  // 不推荐
  class CustomButton: UIButton { /* ... */ }
  ```

- **2.8** 不要缩写、使用缩写名称或单字母名称

  ```
  // 推荐
  class RoundAnimatingButton: UIButton {
      let animationDuration: NSTimeInterval

      func startAnimating() {
          let firstSubview = subviews.first
      }

  }

  // 不推荐
  class RoundAnimating: UIButton {
      let aniDur: NSTimeInterval

      func srtAnmating() {
          let v = subviews.first
      }
  }
  ```

- **2.9** 如果不明显，请在常量或变量名称中包含类型信息。

  ```
  // 推荐
  class ConnectionTableViewCell: UITableViewCell {
      let personImageView: UIImageView

      let animationDuration: TimeInterval

      // 由于属性名称明显可以看出它是字符串，在实例变量名称中就可以不包含字符串了。
      let firstName: String

      // 虽然不推荐，但使用 `Controller` 代替 `ViewController` 也是可以的。
      let popupController: UIViewController
      let popupViewController: UIViewController

      // 当使用 `UIViewController` 的子类时，例如 table view controller、
          // collection view controller 、 split view controller 等，
      // 在名称中完整表明其类型
      let popupTableViewController: UITableViewController

      // 当使用 outlet 时，确保在属性名称中指明 outlet 的类型。
      @IBOutlet weak var submitButton: UIButton!
      @IBOutlet weak var emailTextField: UITextField!
      @IBOutlet weak var nameLabel: UILabel!

  }

  // 不推荐
  class ConnectionTableViewCell: UITableViewCell {
      // 这不是 `UIImage` 所以不应该被叫做 image 而应该使用
          // personImageView
      let personImage: UIImageView

      // 这不是 `String`，所以它应该叫做 `textLabel`
      let text: UILabel

      // `animation` 没有很清晰地表明是时间间隔
      // 使用 `animationDuration` 或 `animationTimeInterval` 代替它
      let animation: TimeInterval

      // `transition` 没有很明显地表明是 `String`
      // 使用 `transitionText` 或 `transitionString` 代替它
      let transition: String

      // 这是 view controller — 而不是 view
      let popupView: UIViewController

      // 如前所述，我们不想使用缩写，所以不要用 `VC` 代替 `ViewController`
      let popupVC: UIViewController

      // 虽然在技术上这仍然是 `UIViewController`，但这个属性应该表明我们正在使用 *Table* View Controller
      let popupViewController: UITableViewController

      // 为了一致性，你应该把类型名称放在属性名称的结尾而不是开头。
      @IBOutlet weak var btnSubmit: UIButton!
      @IBOutlet weak var buttonSubmit: UIButton!

      // 当处理 outlet 时，我们应该总是在属性名称中含有类型。
      // 例如，我们应该用 `firstNameLabel` 代替。
      @IBOutlet weak var firstName: UILabel!
  }
  ```

- **2.10** 命名函数参数时，请确保函数可以被轻易地阅读并理解每个参数的目的。
- **2.11** 按照 [Apple 的 API 设计规范](https://swift.org/documentation/api-design-guidelines/)，如果 `protocol` 描述「某事物在做什么」，那么应被命名为名词（比如 `Collection` ）。 如果 `protocol` 描述「一种能力」，使用后缀 `able` 、 `ible` 或 `ing`（比如 `Equatable` 、`ProgressReporting` ）。如果两种选项都不适用你的用例，你也可以在协议名称后加一个 `Protocol` 后缀。一些 `protocol` 的例子如下。

  ```
  // 这里的名称是描述「协议在做什么」的名词。
  protocol TableViewSectionProvider {
      func rowHeight(at row: Int) -> CGFloat
      var numberOfRows: Int { get }
      /* ... */
  }

  // 这里的协议是一种能力，我们恰当地命名它。
  protocol Loggable {
      func logCurrentState()
      /* ... */
  }

  // 假设有个 `InputTextView` 类，但我们也想让协议概括一些能力—使用 `Protocol` 后缀非常恰当。
  protocol InputTextViewProtocol {
      func sendTrackingEvent()
      func inputText() -> String
      /* ... */
  }
  ```

## 3. 编码风格

### 3.1 通用

- **3.1.1** 尽可能选择 `let` 而非 `var` .
- **3.1.2** 当从一个集合转换到另一个集合时，建议首选 `map` ， `filter` ， `reduce` 等高阶函数。在使用这些方法时，请确保使用的闭包没有任何副作用。

  ```
  // 推荐
  let stringOfInts = [1, 2, 3].flatMap { String($0) }
  // ["1", "2", "3"]

  // 不推荐
  var stringOfInts: [String] = []
  for integer in [1, 2, 3] {
      stringOfInts.append(String(integer))
  }

  // 推荐
  let evenNumbers = [4, 8, 15, 16, 23, 42].filter { $0 % 2 == 0 }
  // [4, 8, 16, 42]

  // 不推荐
  var evenNumbers: [Int] = []
  for integer in [4, 8, 15, 16, 23, 42] {
      if integer % 2 == 0 {
          evenNumbers.append(integer)
      }
  }
  ```

- **3.1.3** 如果常量或变量的类型可以被推导，则不去主动声明它的类型。

- **3.1.4** 如果一个方法返回多个值，那么推荐使用 inout 修饰的元组类型作为返回值类型 （如果类型不够一目了然，最好使用命名元组来表明你要返回的内容） 。 如果你会多次使用到某个特定的元组，那么可以考虑使用 typealias 。 如果你的元组里返回了 3 个及以上的元素，那么使用 struct 或者 class 可能比元组更合适。

  ```
  func pirateName() -> (firstName: String, lastName: String) {
      return ("Guybrush", "Threepwood")
  }

  let name = pirateName()
  let firstName = name.firstName
  let lastName = name.lastName
  ```

- **3.1.5** 在为类声明代理或者协议的时候，要注意循环引用，通常这些属性在声明时要用 weak 修饰。

- **3.1.6** 在逃逸闭包中直接调用 self 的时候，要注意是否会引起循环引用。 - 当可能发生循环引用时尝试使用 capture list :

  ```
  myFunctionWithEscapingClosure() { [weak self] (error) -> Void in
      // 你可以这么做

      self?.doSomething()

      // 你也可以这么做

      guard let strongSelf = self else {
          return
      }

      strongSelf.doSomething()
  }
  ```

- **3.1.7** 不要使用 labeled breaks.

- **3.1.8** 流程控制语句的条件语句不需要加括弧。

  ```
  // 推荐
  if x == y {
      /* ... */
  }

  // 不推荐
  if (x == y) {
      /* ... */
  }
  ```

- **3.1.9** 可以使用点语法直接写出枚举值，前面不需要写出枚举类型

  ```
  // 推荐
  imageView.setImageWithURL(url, type: .person)

  // 不推荐
  imageView.setImageWithURL(url, type: AsyncImageView.Type.person)
  ```

- **3.1.10** 在声明类方法的时候不要使用缩写，因为和 `enum` 相比，推导类的上下文会更难。

  ```
  // 推荐
  imageView.backgroundColor = UIColor.white

  // 不推荐
  imageView.backgroundColor = .white
  ```

- **3.1.11** 除非必要，否则尽量不使用 `self.` 。

- **3.1.12** 写方法时，要考虑这个方法是否会被重载。如果不会，标记为 `final`，但请记住，这是为了防止以测试为目的而重载方法。通常， `final` 方法会将编译时间缩短，所以适时使用它是非常棒的。 但是，在库中应用 `final` 关键词要非常小心。因为相对于在本地项目中将某些内容改为非 `final` ，在库中将某些内容改为非 `final` 可不是小事。

- **3.1.13** 使用诸如 `else` 、 `catch` 等后面跟随代码块的语句，将关键字 和代码块放在同一行。强调一下，我们遵循 1TBS 风格 。`if` / `else` 和 `do` / `catch` 的示例如下。

  ```
  if someBoolean {
      // 做某些事
  } else {
      // 做另一些事
  }

  do {
      let fileContents = try readFile("filename.txt")
  } catch {
      print(error)
  }
  ```

- **3.1.14** 在定义与类相关的函数或属性而不是定义类的实例变量时，推荐 `static` ，而不是 `class`。如果你特别需要在子类中重载这个函数的功能时，请使用 `class` 。但是，你应该考虑使用 `protocol` 来达到这个目的。

- **3.1.15** 如果有一个函数是无参数的、无副作用的而且返回某个对象或值，更推荐使用计算属性来代替它。

### 3.2 访问修饰符

- **3.2.1** 如果需要写访问修饰符关键字的话，请将它写在开头。

  ```
  // 推荐
  private static let myPrivateNumber: Int

  // 不推荐
  static private let myPrivateNumber: Int
  ```

- **3.2.2** 访问修饰符关键字不应该独占一行，而是将它和其描述的东西放在一行。

  ```
  // 推荐
  open class Pirate {
      /* ... */
  }

  // 不推荐
  open
  class Pirate {
      /* ... */
  }
  ```

- **3.2.3** 通常情况下，访问修饰符关键字默认是 `internal`，所以不用写出来。

- **3.2.4** 如果属性需要被单元测试访问，则需要将它标记为 `internal` ，以便于使用 `@testable import ModuleName` 。如果属性 应该 是私有的，但是出于单元测试的目的将它声明为 `internal`，一定要添加适当的文档注释来解释这一点。 为了更加简明，你可以使用 `- warning:` 标记语法，如下所示。

  ```
  \**
  这个属性定义海盗的名字。
  - warning: 不要为 `@testable` 添加 `private` 访问修饰符
  */
  let pirateName = "LeChuck"
  ```

- **3.2.5** 尽可能使用 `private` 而不是 `fileprivate` 。

- **3.2.6** 当在 `public` 和 `open` 两者之间选择一个时，如果你打算让某些内容在模块外也可以被继承，推荐使用 `open` ，否则请使用 `public`。注意，任何 `internal` 或更高访问权限的内容，都可以通过使用 `@testable import` 在测试中被继承。所以这不应该成为使用 `open` 的理由。通常，在涉及到库的时候，更倾向于自由地使用 `open` 。但是， `open` 可以轻易地同时改变应用程序中多个模块的内容。当涉及到这类代码库中的模块时，更倾向于保守地使用 `open` 。

### 3.3 自定义运算符

推荐创建自定义运算符。

如果要引入自定义运算符，确保你有一个很好的理由，为什么你想把一个新的运算符引入全局范围，而不是使用其他现有的运算符。

可以重写现有的运算符以支持新类型 (特别是 `==` )。然而，你新定义的必须保存运算符的语义。例如， `==` 必须是检测是否相等并返回检测结果的布尔值。

### 3.4 Switch 语句和枚举

- **3.4.1** 当使用具有有限可能性的 `switch` 语句 ( `enum` )，不包括 `default` 的其他情况。将未处理的情况放置在 `default` 里，并使用 `break` 来结束执行。

- **3.4.2** 在 `Swift` 中由于 `switch` 的各种情况中默认有 `break` ，如果不需要，可以省略 break 关键字。

- **3.4.3** `case` 和 `switch` 的声明要按照 `Swift` 的规范独占一行。

- **3.4.4** 当定义具有关联值的情况时，确保这个值被适当的标记，例如：`case hunger(hungerLevel: Int)` 而不是 `case hunger(Int)` 。

  ```
  enum Problem {
      case attitude
      case hair
      case hunger(hungerLevel: Int)
  }

  func handleProblem(problem: Problem) {
      switch problem {
      case .attitude:
          print("At least I don't have a hair problem.")
      case .hair:
          print("Your barber didn't know when to stop.")
      case .hunger(let hungerLevel):
          print("The hunger level is \(hungerLevel).")
      }
  }
  ```

- **3.4.5** 更推荐使用 `fallthrough` 关键字来处理一系列的 `cases` （例如: `case 1, 2, 3:` ）。

- **3.4.6** 如果您有一个不应该达到的默认情况，最好抛出一个错误（或处理其他类似的方法，如断言）。

  ```
  func handleDigit(_ digit: Int) throws {
      switch digit {
      case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
          print("Yes, \(digit) is a digit!")
      default:
          throw Error(message: "The given number was not a digit.")
      }
  }
  ```

### 3.5 可选类型

- **3.5.1** 使用隐式解包可选类型的唯一机会是使用 `@IBOutlet` 的时候。在其他情况下，使用非可选或常规可选的属性会更好。是的，有某些情况下，你可以「保证」使用时属性不会为 `nil` ，但是安全和一致会更好。同样，不要使用强制解包。

- **3.5.2** 不要使用 as! 或 try!.

- **3.5.3** 如果你不打算真正地使用存在可选类型中的值，但需要判断这个值是否为 `nil` ，显式地检查这个值是不是 `nil` ，而不是使用 `if let` 语法。

  ```
  // 推荐
  if someOptional != nil {
      // 做某件事
  }

  // 不推荐
  if let _ = someOptional {
      // 做某件事
  }
  ```

- **3.5.4** 不要使用 `unowned` 。你可以将 `unowned` 视为被隐式解包的 weak 属性的等价物（虽然 `unowned` 因为完全忽略引用计数而略有性能上的提升）。因为我们不想有隐式解包，所以我们同样也不想要 `unowned` 属性。

  ```
  // 推荐
  weak var parentViewController: UIViewController?

  // 不推荐
  weak var parentViewController: UIViewController!
  unowned var parentViewController: UIViewController
  ```

- **3.5.5** 在解包可选类型时，在恰当的地方使用相同名称来命名解包的常量或变量。

  ```
  guard let myValue = myValue else {
      return
  }
  ```

### 3.6 协议

在实现协议时，有两种方式组织代码：

使用 `// MARK:` 注释将协议实现和其他部分的代码隔开。
在同一资源文件中 `class/struct` 实现代码以外的地方，使用扩展。
记住使用扩展时，无论怎样，扩展中的方法不要被子类重载，这会使测试变麻烦。如果这是一个通用的使用场景，为了一致性使用方法 #1 可能会更好。否则，#2 可以使关系的拆分更清楚。

即使使用方法 #2 ，也要添加 `// MARK: 语句`，以便在 Xcode 的方法 / 属性 / 类等的列表 UI 中更加易读。

### 3.7 属性

- **3.7.1** 如果创建只读的计算属性，提供不带 get {} 的获取方法。

```
var computedProperty: String {
    if someBool {
        return "I'm a mighty pirate!"
    }
    return "I'm selling these fine leather jackets."
}
```

- **3.7.2** 使用 `get {}` 、 `set {}` 、 `willSet` 和 `didSet` 时，缩进这些块。
- **3.7.3** 虽然你可以为 `willSet`/`didSet` 和 `set` 自定义新值或旧值的名称，但请使用默认提供的标准标识符 `newValue` / `oldValue` 。

  ```
  var storedProperty: String = "I'm selling these fine leather jackets." {
      willSet {
          print("will set to \(newValue)")
      }
      didSet {
          print("did set from \(oldValue) to \(storedProperty)")
      }
  }

  var computedProperty: String  {
      get {
          if someBool {
              return "I'm a mighty pirate!"
          }
          return storedProperty
      }
      set {
          storedProperty = newValue
      }
  }
  ```

- **3.7.4** 你可以按如下方式声明一个单例属性：

  ```
  class PirateManager {
      static let shared = PirateManager()

      /* ... */
  }
  ```

### 3.8 闭包

- **3.8.1** 如果可以明确参数类型，即可以省略参数类型也可以显示参数类型。你可以根据场景决定是否添加一些说明来提高代码的可读性，或者是省略一些无关紧要的部分。

  ```
  // 省略参数类型
  doSomethingWithClosure() { response in
      print(response)
  }

  // 明确参数类型
  doSomethingWithClosure() { response: NSURLResponse in
      print(response)
  }

  // 参数名缩写
  [1, 2, 3].flatMap { String($0) }
  ```

- **3.8.2** 声明了一个闭包，不需要用括号括起来，除非需要（例如，闭包类型是可选的，或者这个闭包在另一个闭包内）。闭包的参数都是是放在圆括号里，如果用 `()` 就表示没有参数，用 `Void` 表示无返回值。

  ```
  let completionBlock: (Bool) -> Void = { (success) in
      print("Success? \(success)")
  }

  let completionBlock: () -> Void = {
      print("Completed!")
  }

  let completionBlock: (() -> Void)? = nil
  ```

- **3.8.3** 在闭包中尽可能的让参数保持在同一行，避免过多换行。（确保每行小于 160 个字符）。
- **3.8.4** 如果闭包的含义不太明确可以使用尾随闭包（如果一个方法同时含有成功和失败的两个闭包就不建议使用尾随闭包）。

  ```
  // 尾随闭包
  doSomething(1.0) { (parameter1) in
      print("Parameter 1 is \(parameter1)")
  }

  // 无尾随闭包
  doSomething(1.0, success: { (parameter1) in
      print("Success with \(parameter1)")
  }, failure: { (parameter1) in
      print("Failure with \(parameter1)")
  })
  ```

### 3.9 数组

- **3.9.1** 通常要避免直接用下标的方式访问数组。尽可能使用访问器，比如 `.first` 或 `.last`。它们是可选类型并且不会导致崩溃。推荐尽可能地使用 `for item in items` 语法而不是类似与 `for i in 0 ..< items.count` 的语法。如果你需要直接用下标访问数组，一定要做适当的边界检查。你可以使用 `for (index, value) in items.enumerated()` 来一并得到索引和值。

- **3.9.2** 不要使用 `+=` 或 `+` 操作符来追加或串联到数组。而是使用 `.append()` 或 `.append(contentsOf:)`，因为在 `Swift` 当前的状况下它们（至少在编译方面）拥有更高的性能。如果基于其他数组声明数组而且想让它保持不变，使用 `let myNewArray = [arr1, arr2].joined()`，而不是 `let myNewArray = arr1 + arr2`。

### 3.10 错误处理

假设函数 `myFunction` 应该返回 `String`，但是，某些时候它会运行错误。在出错时返回 `nil` 的情况下，通用的处理方式是让函数返回可选类型 `String?`。

例如：

```
func readFile(named filename: String) -> String? {
    guard let file = openFile(named: filename) else {
        return nil
    }

    let fileContents = file.read()
    file.close()
    return fileContents
}

func printSomeFile() {
    let filename = "somefile.txt"
    guard let fileContents = readFile(named: filename) else {
        print("Unable to open file \(filename).")
        return
    }
    print(fileContents)
}
```

相反，在适当的时候，我们应该使用 `Swift` 的 `try/catch` 操作来了解失败原因。

你可以使用 `struct`，如下所示：

```
struct Error: Swift.Error {
    public let file: StaticString
    public let function: StaticString
    public let line: UInt
    public let message: String

    public init(message: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        self.file = file
        self.function = function
        self.line = line
        self.message = message
    }
}
```

用法示例：

```
func readFile(named filename: String) throws -> String {
    guard let file = openFile(named: filename) else {
        throw Error(message: "Unable to open file named \(filename).")
    }

    let fileContents = file.read()
    file.close()
    return fileContents
}

func printSomeFile() {
    do {
        let fileContents = try readFile(named: filename)
        print(fileContents)
    } catch {
        print(error)
    }
}
```

有一些例外情况，使用可选类型比使用错误处理更有意义。当返回结果语义上可能是 `nil`，而不是取回结果时的错误值时，返回可选类型比使用错误处理更有意义。

通常，如果方法可能「失败」，并且返回值为可选类型，失败的原因就不是很明显了，那么方法抛出错误可能会更有意义。

### 3.11 使用 guard 语句

- **3.11.1** 一般情况下，我们推荐在适用的地方使用「尽早返回」的策略 而不是在 `if` 语句里嵌套代码。在这种使用场景下，使用 `guard` 语句通常很有用，而且可以提升代码的可读性。

  ```
  // 推荐
  func eatDoughnut(at index: Int) {
      guard index >= 0 && index < doughnuts.count else {
          // 尽早返回因为索引越界了
          return
      }

      let doughnut = doughnuts[index]
      eat(doughnut)
  }

  // 不推荐
  func eatDoughnut(at index: Int) {
      if index >= 0 && index < doughnuts.count {
          let doughnut = doughnuts[index]
          eat(doughnut)
      }
  }
  ```

- **3.11.2** 当解包可选类型时，推荐 `guard` 语句而不是 `if` 语句来减少代码中嵌套缩进的数量。

```
// 推荐
guard let monkeyIsland = monkeyIsland else {
    return
}
bookVacation(on: monkeyIsland)
bragAboutVacation(at: monkeyIsland)

// 不推荐
if let monkeyIsland = monkeyIsland {
    bookVacation(on: monkeyIsland)
    bragAboutVacation(at: monkeyIsland)
}

// 甚至更不推荐
if monkeyIsland == nil {
    return
}
bookVacation(on: monkeyIsland!)
bragAboutVacation(at: monkeyIsland!)
```

- **3.11.3** 在解包类型不复杂，需要在使用 `if` 还是 `guard` 之间做抉择时，要记住最重要的是代码的可读性。会有很多可能的情况，例如依赖于两个不同的布尔值、复杂逻辑语句涉及到多个判断等，所以通常使用您的最佳的判断来写出可读且一致的代码。如果你不确定 `guard` 或 `if` 哪个更具可读性或者它们看起来同样可读，推荐使用 `guard`。

  ```
  // 这里 `if` 语句的可读性很高
  if operationFailed {
      return
  }

  // 这里 `guard` 语句的可读性很高
  guard isSuccessful else {
      return
  }

  // 像这种双重否定逻辑很难读懂—即不要这样做
  guard !operationFailed else {
      return
  }
  ```

- **3.11.4** 如果在两种语句之间做选择，使用 `if` 语句比使用 `guard` 语句更有意义。

  ```
  // 推荐
  if isFriendly {
      print("Hello, nice to meet you!")
  } else {
      print("You have the manners of a beggar.")
  }

  // 不推荐
  guard isFriendly else {
      print("You have the manners of a beggar.")
      return
  }

  print("Hello, nice to meet you!")
  ```

- **3.11.5** 只有在失败会导致退出当前上下文的情况下，才应该使用 `guard`。 下面是一个例子，在其中使用两个 `if` 语句而不是使用两个 `guard` 语句更有意义 — 有两个不相互阻塞的无关条件。

```
if let monkeyIsland = monkeyIsland {
    bookVacation(onIsland: monkeyIsland)
}

if let woodchuck = woodchuck, canChuckWood(woodchuck) {
    woodchuck.chuckWood()
}
```

- **3.11.6** 通常，我们可能遇到需要使用 guard 语句解包多个可选类型的情况。一般情况下，如果处理每个解包的失败是相同的（例如，`return`、`break`、`continue`、`throw` 或一些其他的 `@noescape`），将解包合入一个 `guard` 语句。

  ```
  // 因为只是返回，所以合并为一个。
  guard let thingOne = thingOne,
      let thingTwo = thingTwo,
      let thingThree = thingThree else {
      return
  }

  // 因为在每种情况下处理特定的错误，所以拆分成单独的语句。
  guard let thingOne = thingOne else {
      throw Error(message: "Unwrapping thingOne failed.")
  }

  guard let thingTwo = thingTwo else {
      throw Error(message: "Unwrapping thingTwo failed.")
  }

  guard let thingThree = thingThree else {
      throw Error(message: "Unwrapping thingThree failed.")
  }
  ```

- **3.11.7** 不要将 `guard` 语句写成只有一行。

  ```
  // 推荐
  guard let thingOne = thingOne else {
      return
  }

  // 不推荐
  guard let thingOne = thingOne else { return }
  ```

## 4. 文档 / 注释

### 4.1 文档

4.1 文档

如果函数比简单的 O (1) 操作负责，通常应该考虑为函数加个文档。因为方法签名的一些信息可能不是那么明显。如果实现方式有任何怪癖，无论在技术上有趣、棘手、不明显等等，都应该被文档化。应该为复杂的类 / 结构体 / 枚举 / 协议和属性添加文档。所有的 `public` 函数 / 类 / 属性 / 常量 / 结构体 / 枚举 / 协议等也应该被文档化。（如果，他们的签名 / 名称不能使他们含义 / 功能很明显）。

写完文档注释之后，你应该按住 option 键并单击函数 / 属性 / 类等等来确认文档注释被正确地格式化了。

务必查看 Swift 注释标记中提供的全套功能，详见 Apple 的文档。

原则:

- **4.1.1** 160 个字符列的限制（和代码的部分一样）。

- **4.1.2** 如果文档注释在一行内，使用（ `/** */` ）。

- **4.1.3** 不要在每一个附加行前面加 `*`。

- **4.1.4** 使用新的 `- parameter` 语法而不是旧的 `:param:` 语法（务必使用小写的 `parameter` 而并不是 `Parameter` ）。 按住 `Option` 键并单击你写的方法以确保快速帮助看起来是正确的。

  ```
  class Human {
      /**
      这个方法向某人喂某种事物。

      - parameter food: 你想被他吃的食物
      - parameter person: 应该吃食物的人
      - returns: 如果食物被那个人吃了，为 True；否则为 false。
      */
      func feed(_ food: Food, to person: Human) -> Bool {
          // ...
      }
  }
  ```

- **4.1.5** 如果你要给方法的参数 / 返回值 / 抛出的异常写文档，即使某些文档最终会有重复，也请将它们都写入文档（这比文档看起来不完整更可取）。有时，如果仅有一个参数需要写文档，在描述中提及它更好一些。

- **4.1.6** 对于复杂的类，请使用一些看起来合适的示例来描述类的用法。记住在 Swift 注释文档中可以使用 markdown 语法。因此，换行符、列表等等都是适用的。

  ```
  /**
  ## 功能支持

  这个类做了一些很棒的事情。它支持：

  - 功能 1
  - 功能 2
  - 功能 3

  ## 示例

  这有一个用例，由于它表示一个代码块，所以使用四个空格缩进：

      let myAwesomeThing = MyAwesomeClass()
      myAwesomeThing.makeMoney()

  ## 警告

  有一些你需要注意的事项：

  1. 事项一
  2. 事项二
  3. 事项三
  */
  class MyAwesomeClass {
      /* ... */
  }
  ```

- **4.1.7** 提及代码时，请使用代码提示 - `

  ```
  /**
  或许这里使用 `UIViewController` 做了某事
  - warning: 在运行这个函数之前，请确保 `someValue` 为 `true`。
  */
  func myFunction() {
      /* ... */
  }
  ```

- **4.1.8** 写文档注释时，尽可能保持简洁。

### 4.2 其他注释原则

- **4.2.1** 始终在 `//` 后面加个空格。
- **4.2.2** 始终在自己的行中写注释。
- **4.2.3** 使用 `// MARK: -` 无论是什么 时，在注释后加个空行。

  ```
  class Pirate {

      // MARK: - 实例属性

      private let pirateName: String

      // MARK: - 构造函数

      init() {
          /* ... */
      }

  }
  ```

> 原文地址：https://github.com/linkedin/swift-style-guide/
>
> 译文地址：https://learnku.com/ios/t/23230/linkedin-official-swift-style-guide
