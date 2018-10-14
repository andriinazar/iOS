import UIKit

class Calculator {
    
    //01
    static let instance: Calculator = Calculator()
    var result: Rational?
    private init() {
        self.result = Rational()
    }
    
    //02
    public func plus(lhs: Rational, rhs: Rational) -> Calculator {
        let (lnum, rnum, denom) = numsWithCommonDenom(lhs, rhs)
        self.result = Rational(lnum + rnum, denominator: denom)
        return self
    }
    //07
    public func minus(lhs: Rational, rhs: Rational) -> Calculator {
        let (lnum, rnum, denom) = numsWithCommonDenom(lhs, rhs)
        self.result = Rational(lnum - rnum, denominator: denom)
        return self
    }
    
    public static func myltiply(lhs: Rational, rhs: Rational) -> Calculator {
        instance.result = Rational(lhs.numerator * rhs.numerator,
                               denominator: lhs.denominator * rhs.denominator)
        return instance
    }
    
    public static func div(lhs: Rational, rhs: Rational) -> Calculator {
        instance.result = Rational(lhs.numerator * rhs.denominator,
                               denominator: lhs.denominator * rhs.numerator)
        return instance
    }
    
    //07
    public func plus(rhs: Rational) -> Calculator {
        let (lnum, rnum, denom) = numsWithCommonDenom(self.result != nil ? self.result! : Rational(), rhs)
        self.result = Rational(lnum + rnum, denominator: denom)
        return self
    }
    //07
    public func minus(rhs: Rational) -> Calculator {
        let (lnum, rnum, denom) = numsWithCommonDenom(self.result != nil ? self.result! : Rational(), rhs)
        self.result = Rational(lnum - rnum, denominator: denom)
        return self
    }
    
    public static func myltiply(rhs: Rational) -> Calculator {
        instance.result = Rational(instance.result != nil ? instance.result!.numerator : Rational().numerator * rhs.numerator, denominator: instance.result != nil ? instance.result!.denominator : Rational().denominator * rhs.denominator)
        return instance
    }
    
    public static func div(rhs: Rational) -> Calculator {
        instance.result = Rational(instance.result != nil ? instance.result!.denominator : Rational().denominator * rhs.denominator,
                               denominator: instance.result != nil ? instance.result!.numerator : Rational().numerator * rhs.numerator)
        return instance
    }
    
    func numsWithCommonDenom(_ left: Rational, _ right: Rational) -> (lnum: Int, rnum: Int, denom: Int) {
        
        let leftNumerator: Int
        let rightNumerator: Int
        let commonDenominator: Int
        
        if left.denominator == right.denominator {
            
            leftNumerator     = left.numerator
            rightNumerator    = right.numerator
            commonDenominator = left.denominator
            
        } else {
            
            let commonDivisor   = Rational.gcd(left.denominator, right.denominator)
            let leftMultiplier  = right.denominator / commonDivisor
            let rightMultiplier = left.denominator  / commonDivisor
            
            leftNumerator     = left.numerator   * leftMultiplier
            rightNumerator    = right.numerator  * rightMultiplier
            commonDenominator = left.denominator * leftMultiplier
        }
        
        return (lnum: leftNumerator, rnum: rightNumerator, denom: commonDenominator)
    }
    
}
class Rational: Equatable {
    var value: Double
    var numerator: Int
    var denominator: Int
    
    init() {
        self.numerator = 0
        self.denominator = 0
        self.value = 0
    }
    init(_ numerator: Int, denominator: Int) {

        let divisor = Rational.gcd(Swift.abs(numerator), Swift.abs(denominator))
        
        let num = (denominator > 0 ? numerator : -numerator) / divisor
        let denom = Swift.abs(denominator) / divisor
        
        self.numerator = num
        self.denominator = denom
        self.value = Double(num / denom)
    }
    
    //05
    init(copy: Rational) {
        self.value = copy.value
        self.denominator = copy.denominator
        self.numerator = copy.numerator
    }
    
    public var description: String { return "\(numerator)" + "/" + "\(denominator)" }
    
    /// Returns the Greatest Common Divisor (GCD) of two non-negative integers
    public static func gcd(_ a: Int, _ b: Int) -> Int {
        
        guard a != 0 else { return b }
        guard b != 0 else { return a }
        
        var a = a, b = b, n = Int()
        
        // Remove the largest 2ⁿ from them:
        while (a | b) & 1 == 0 { a >>= 1; b >>= 1; n += 1 }
        
        // Reduce `a` to odd value:
        while a & 1 == 0 { a >>= 1 }
        
        repeat {
            
            // Reduce `b` to odd value
            while b & 1 == 0 { b >>= 1 }
            
            // Both `a` & `b` are odd here (or zero maybe?)
            
            // Make sure `b` is greater
            if a > b { swap(&a, &b) }
            
            // Subtract smaller odd `a` from the bigger odd `b`,
            // which always gives a positive even number (or zero)
            b -= a
            
            // keep repeating this, until `b` reaches zero
        } while b != 0
        
        return a << n // 2ⁿ×a
    }
    
    //04
    static func ==(lhs: Rational, rhs: Rational) -> Bool {
        
        return lhs.numerator == rhs.numerator && lhs.denominator == rhs.denominator
    }
    
    static func !=(lhs: Rational, rhs: Rational) -> Bool {
        
        return lhs.numerator != rhs.numerator || lhs.denominator != rhs.denominator
    }
    
    static func <(lhs: Rational, rhs: Rational) -> Bool {
        
        return lhs.numerator * rhs.denominator < rhs.numerator * lhs.denominator
    }
    
    static func >(lhs: Rational, rhs: Rational) -> Bool {
        
        return lhs.numerator * rhs.denominator > rhs.numerator * lhs.denominator
    }
    
    func numsWithCommonDenom(_ left: Rational, _ right: Rational) -> (lnum: Int, rnum: Int, denom: Int) {
        
        let leftNumerator: Int
        let rightNumerator: Int
        let commonDenominator: Int
        
        if left.denominator == right.denominator {
            
            leftNumerator     = left.numerator
            rightNumerator    = right.numerator
            commonDenominator = left.denominator
            
        } else {
            
            let commonDivisor   = Rational.gcd(left.denominator, right.denominator)
            let leftMultiplier  = right.denominator / commonDivisor
            let rightMultiplier = left.denominator  / commonDivisor
            
            leftNumerator     = left.numerator   * leftMultiplier
            rightNumerator    = right.numerator  * rightMultiplier
            commonDenominator = left.denominator * leftMultiplier
        }
        
        return (lnum: leftNumerator, rnum: rightNumerator, denom: commonDenominator)
    }
}


//08
Calculator.instance.plus(lhs: Rational(1, denominator: 2),  rhs:Rational(1, denominator: 2))
print(Calculator.instance.result!.description)


Calculator.instance.plus(lhs: Rational(1, denominator: 4),  rhs:Rational(1, denominator: 4))
print(Calculator.instance.result!.description)

Calculator.instance.plus(rhs: Rational(2, denominator: 6))
print(Calculator.instance.result!.description)

Calculator.instance.minus(lhs: Rational(3, denominator: 4),  rhs:Rational(1, denominator: 4))
print(Calculator.instance.result!.description)

Calculator.instance.minus(rhs: Rational(1, denominator: 10))
print(Calculator.instance.result!.description)

Calculator.div(lhs: Rational(1, denominator: 4),  rhs:Rational(1, denominator: 6))
print(Calculator.instance.result!.description)

Calculator.div(rhs: Rational(5, denominator: 6))
print(Calculator.instance.result!.description)

Calculator.myltiply(lhs: Rational(6, denominator: 4),  rhs:Rational(1, denominator: 4))
print(Calculator.instance.result!.description)

Calculator.myltiply(rhs: Rational(1, denominator: 6))
print(Calculator.instance.result!.description)

let rationa1: Rational = Rational(1, denominator: 4)
let rationa2: Rational = Rational(1, denominator: 2)

print(rationa1 == rationa2)
print(rationa1 != rationa2)
print(rationa1 > rationa2)
print(rationa1 < rationa2)




