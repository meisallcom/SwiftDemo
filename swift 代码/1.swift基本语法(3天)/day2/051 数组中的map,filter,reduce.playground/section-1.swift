// Clojures Playground
//资料参考 http://www.cocoachina.com/swift/20150619/12173.html
import Cocoa
//平常写法 

func square(a:Float) -> Float {
    return a * a
}

func cube(a:Float) -> Float {
    return a * a * a
}

func averageSumOfSquares(a:Float,b:Float) -> Float {
    return (square(a) + square(b)) / 2.0
}

func averageSumOfCubes(a:Float,b:Float) -> Float {
    return (cube(a) + cube(b)) / 2.0
}

averageSumOfSquares(3, b: 4)
averageSumOfCubes(3, b: 4)

func averageOfFunction(a:Float,b:Float,f:(Float -> Float)) -> Float {
    return (f(a) + f(b)) / 2
}

averageOfFunction(3, b: 4, f: square)
averageOfFunction(3, b: 4, f: cube)

averageOfFunction(3, b: 4, f: {(x: Float) -> Float in return x * x})
averageOfFunction(3, b: 4, f: {x in return x * x})

averageOfFunction(3, b: 4, f: {x in x * x})
averageOfFunction(3, b: 4, f: {$0 * $0})

var moneyArray = [10,20,45,32]

var stringsArray : Array<String> = []


for money in moneyArray {
    stringsArray += ["\(money)€"]
}

print(stringsArray)
//map用于将每个数组元素通过某个方法进行转换。也就是按照一定的规则转换成另一个数组
//{"($0)?"}就是一个闭包，它把金额转成字符并在尾部添加一个字符?
//swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数
stringsArray = moneyArray.map({ "\($0)€" })
stringsArray = moneyArray.map({money in "\(money)€"})

print(stringsArray)

var filteredArray : Array<Int> = []

for money in moneyArray {
    if (money > 30) {
        filteredArray += [money]
    }
}

print(filteredArray)
//filter用于选择数组元素中满足某种条件的元素就是筛选的功能，参数是一个用来判断是否筛除的筛选闭包
//{$0 > 30}为筛选闭包，我们忽略了参数名而使用默认参数$0，返回类型隐式推断为Bool 以返回true或false的函数includeElement作为参数，对原数组元素调用includeElement时，只有返回true的元素会通过筛选

filteredArray = moneyArray.filter({$0 > 30})

print(filteredArray)

var sum = 0
for money in moneyArray {
    sum += money
}

print(sum)
//reduce方法把数组元素组合计算为一个值。
//$0为计算结果类型，$1为数组元素类型。
sum = moneyArray.reduce(0,combine: {$0 + $1})

sum = moneyArray.reduce(0,combine: +)

print(sum)
