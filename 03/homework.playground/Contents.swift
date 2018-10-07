import UIKit

// Task1
var str = "Hello world"
print(str)

//Task2

//01
let int1 = 12

//02
let int2 = -100

//03
let hexInt = 0x80

//04
let minInt16 = Int16.min

//05
let maxInt64 = Int64.max

//06
let doubleVal: Double = 10235.34

//07
let symbol: Character = "a"

//08
let helloWorldStr = "Hello world"

//09
let bool: Bool = true

//10
let intTyple:(Int,String) = (12, "twelve")

//Task2

var helloWorld = "Hello World. This is Swift programming language"

//01
let lenght = helloWorld.count

//02
let replaseStr = helloWorld.replacingOccurrences(of: "i", with: "u")

//03
helloWorld.remove(at:String.Index.init(encodedOffset: 4))
helloWorld.remove(at:String.Index.init(encodedOffset: 7))
helloWorld.remove(at:String.Index.init(encodedOffset: 10))

//04
helloWorld = helloWorld + " (modified)"

//05
let isEmpty: Bool = helloWorld.isEmpty
print(isEmpty)

//06
helloWorld = helloWorld + "."

//07
let isBeginCorrect: Bool = helloWorld.hasSuffix("Hello")
print(isBeginCorrect)

//08
let isCurrectEnd: Bool = helloWorld.hasPrefix("world.")
print(isCurrectEnd)

//09
helloWorld.insert("-", at: String.Index.init(encodedOffset: 10))

//10
helloWorld.replacingOccurrences(of: "Thus us", with: "It is")

//11
let index1 = helloWorld.index(helloWorld.startIndex, offsetBy: 10)
let index2 = helloWorld.index(helloWorld.startIndex, offsetBy: 15)
print(helloWorld[index1])
print(helloWorld[index2])

//12
let substring = helloWorld[String.Index.init(encodedOffset: 10)..<String.Index.init(encodedOffset: 15)]
print(substring)

//TASK4

//01
var integerNumber: Int? = nil

//02
var decimalNumber: Double? = nil

//03
integerNumber = 100

//04
integerNumber! += integerNumber!

//05
integerNumber! = -integerNumber!

//06
decimalNumber = Double(integerNumber!)

//07
var pairOrValues: (Int?, Double?) = (integerNumber, decimalNumber)

//08
if pairOrValues.0 != nil {
    print(pairOrValues.0!)
}

//09
if pairOrValues.1 != nil {
    print(pairOrValues.1!)
}

//10
if let _ = decimalNumber {
    print(decimalNumber!)
}















