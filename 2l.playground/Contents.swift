//: Playground - noun: a place where people can play

import Foundation

// First program
func div1 (value: Int) {
    let y1 = value
    let y2 = y1%2
    _ = y2 == 0 ? print("even") : print("odd")
}

div1(value: 4)


// Second program
func div2(value: Int) {
    let x1 = value
    let x2 = x1%3
    _ = x2 == 0 ? print("true") : print("flase")
}

div2(value: 4)


// Third program

var array = [Int]()
var i = 0

while i<100 {
    array.append(i+1)
    i += 1
}

// Fourth program
for element in array where (element%2 == 0) || (element%3 == 0) {
    array.remove(at : (array.index(of: element)!))
}

// Fifth program

func fibonacci (n: Int) -> (Decimal) {
    if (n<3) {
        return 1
    } else {
        var z1 : Decimal = 1, z2 : Decimal = 1, z:Decimal
        for _ in 3...n {
            z = z1+z2
            z1 = z2
            z2 = z
        }
        return z2
    }
}

var fibArray = [Decimal]()
fibArray.append(0)
var n  = 100
for i in 1...n {
    fibArray.append(fibonacci(n: i))
}
print(fibArray)


// Sixth program
func Prime (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
func PrimeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Prime(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}
print (PrimeArray())

