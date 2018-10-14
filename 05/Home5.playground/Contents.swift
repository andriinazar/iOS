import UIKit

//TASK1

//06
class Son {
    //10
    unowned var parent: Person
    
    init(parent: Person) {
        self.parent = parent
        print("init Son call: parrent \(parent.name)")
    }
    
    deinit {
        print("deinit Son call")
    }
}
//01
class Person {
    var name: String
    var child: Son?
    //02
    init (name: String) {
        self.name = name
        print("Init person call \(self.name)")
    }
    //03
    deinit {
        print("deinit Person call")
    }
}

//05
var i = 0
while (i < 2) {
    //04
    Person(name: "Bob")
    i+=1
    
}

//10
autoreleasepool{
//07 - 08
let pappernt: Person = Person(name: "BobEvil")
let child: Son =  Son(parent: pappernt)
pappernt.child = child
}

//Task2

//Part1
//01
class Operand {
    var number: Int
    //02 - 05
    weak var operand: Operand?
    
    init(number: Int) {
        self.number = number
    }
    deinit {
        // comment for task 2 becouse cannot override in child class
        //print("Operand deinit")
    }
}

var operand1: Operand? = Operand(number: 10)
var operand2: Operand? = Operand(number: 20)

//03
var sum: (Operand, Operand) -> (Int) = { (operand1: Operand, operand2: Operand) -> (Int) in
    return operand1.number + operand2.number
}

var result: Int = sum(operand1 != nil ? operand1! : Operand(number: 0), operand2 != nil ? operand2! : Operand(number: 0))
    
//04
operand2?.operand = operand1
operand1?.operand = operand2

operand1 = nil
operand2 = nil


//Part2
//01
class MidifyOperand : Operand {
    var absOperand : (() -> ())? = nil
    init() {
        super.init(number: 0)
        print("init modify operand")
        //04
        absOperand = { [weak self] in
            print(self?.number)
        }
    }
    deinit {
        print("deinit Modify operand")
    }
}

//02
var modifyOperand: MidifyOperand? = MidifyOperand()
modifyOperand = nil

//Task 4
// Done
