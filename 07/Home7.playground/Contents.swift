import UIKit

//Task1
func carryAll(_ arr: [Int]) -> [Int] {
    var result = [Int]()
    
    var carry = 0
    for val in arr.reversed() {
        let total = val + carry
        let digit = total % 10
        carry = total / 10
        result.append(digit)
    }
    
    while carry > 0 {
        let digit = carry % 10
        carry = carry / 10
        result.append(digit)
    }
    
    return result.reversed()
}

func factorial(_ n: Int) -> String {
    var result = [1]
    for i in 2...n {
        result = result.map { $0 * i }
        result = carryAll(result)
    }
    return result.map(String.init).joined()
}

print(factorial(12))
print(factorial(8))

//Task2
func sort<T: Comparable>(sortType: Int, array: [T]) -> [T] {
    
    func sortBuble(array: [T]) -> [T] {
        var arrayForBuble = array
        let arrCount = arrayForBuble.count
        for _ in 0...arrCount - 1 {
            for value in 1...arrCount - 2 {
                if (arrayForBuble[value - 1] > arrayForBuble[value]) {
                    let largeValue = arrayForBuble[value - 1]
                    arrayForBuble[value - 1] = arrayForBuble[value]
                    arrayForBuble[value] = largeValue
                }
            }
        }
        
        return arrayForBuble
    }
    
    func indexOfMinimumItem<T: Comparable>(array: [T], startIndex: Int) -> Int {
        var minimumItemIndex = startIndex
        for index in startIndex..<array.count {
            if array[minimumItemIndex] > array[index] {
                minimumItemIndex = index
            }
        }
        return minimumItemIndex
    }
    
    func selectionSort<T: Comparable> (array: [T]) -> [T] {
        var selectionArray = array
        for index in 0..<selectionArray.count {
            let minimumItemIndex = indexOfMinimumItem(array: selectionArray, startIndex: index)
            if minimumItemIndex != index {
                let swap = selectionArray[minimumItemIndex]
                selectionArray[minimumItemIndex] = selectionArray[index]
                selectionArray[index] = swap
            }
        }
        return selectionArray
    }
    
    if (sortType == 0) {
        return sortBuble(array: array)
    } else {
        return selectionSort(array: array)
    }
    
}

var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]

//Bubble Sort
print(sort(sortType: 0, array: numbers))

//Insetrion Sort
print(sort(sortType: 1, array: numbers))


//Task3
func analyzeSymbol(char: Character) {
    print()
    print("Character: \(char)" )
    let lowerCase = CharacterSet.lowercaseLetters
    let upperCase = CharacterSet.uppercaseLetters
    let strChar = String(char)
    if (lowerCase.isSuperset(of: CharacterSet(charactersIn: strChar))) {
        print("char is lowecase")
    }
    if (upperCase.isSuperset(of: CharacterSet(charactersIn: strChar))) {
        print("char is uppercase")
    }
    if (CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: strChar))) {
        print("char is digit")
    }
    let startChar = Unicode.Scalar("a").value
    let endChar = Unicode.Scalar("z").value
    for alphabet in startChar...endChar {
        
        if let charTmp = Unicode.Scalar(alphabet) {
            if (String(charTmp) == strChar.lowercased()) {
                print("English char")
            }
        }
    }
    
    let ukAlphabet = "абвгдежзийклмнопрстуфхцчшщьюя"
    for alphabet in ukAlphabet {
        if (String(alphabet) == strChar.lowercased()) {
            print("Ukrainian char")
        }
        //print(alphabet)
    }
    //print(engRange)
    
}

analyzeSymbol(char: "F")
analyzeSymbol(char: "a")
analyzeSymbol(char: "Ж")
analyzeSymbol(char: "з")

// Task4
func analyzeString(str: String) -> Dictionary<String,Int>{
    print("String: \(str)")
    var result = [String: Int]()
    for char in str {
        if (result[String(char)] != nil) {
            var currCount = result[String(char)]
            if currCount != nil {
                currCount = currCount! + 1
                result.updateValue(currCount!, forKey: String(char))
            }
        } else {
            result.updateValue(1, forKey: String(char))
        }
    }
    for (key, value) in result{
        if (key == " "){
            print("space: \(value)")
        } else {
            print("\(key): \(value)")
        }
        
    }
    print()
    return result
}

analyzeString(str:"Hellllowwwww test test string")
analyzeString(str:"Hello apple")


//Task5
func findMaxCircleContainsPoint(pointX: Int, pointY: Int, circles: [(x:Int, y:Int, r:Int)]) ->(x:Int, y:Int, r:Int)? {
    var circlesArray: [(x:Int, y:Int, r:Int)] = []
    for i in 0..<circles.count {
        let dx = abs(pointX - circles[i].x)
        let dy = abs(pointY - circles[i].y)
        if (dx * dx + dy * dy <= circles[i].r * circles[i].r) {
            circlesArray.append(circles[i])
        }
    }
    
    if (circlesArray.count == 0) {
        return nil
    } else {
        var bigestCircle:(x:Int, y:Int, r:Int) = circlesArray[0]
        for i in 0..<circlesArray.count - 1 {
            if (circlesArray[i].r > circlesArray[i + 1].r) {
                bigestCircle = circlesArray[i]
            }
        }
        return bigestCircle
    }
}


let cirecles = [(x:15, y:15, r:5), (x:15, y:15, r:10), (x:20, y:20, r:15), (x:10, y:10, r:40)]
let x = 30
let y = 30

let resultCircle = findMaxCircleContainsPoint(pointX: x, pointY: y, circles: cirecles)

if resultCircle != nil {
    print("Largest circle: x = \(resultCircle!.x), y = \(resultCircle!.y), r = \(resultCircle!.r)" )
} else {
    print("No any circles contain point")
}



