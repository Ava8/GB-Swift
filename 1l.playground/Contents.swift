//: Playground - noun: a place where people can play

import Foundation

// First Program
var a = 2
var b = 3
var c = -5

if (a != 0) {
    if (b != 0) && (c != 0){
        let d = (b*b-4*a*c)
        if (d<0) {
            print("No roots")
        } else if (d == 0) {
            let x = (-b)/2*a
            print("root: \(x)")
        } else if (d>0) {
            let x1: Double = ((Double(-b))+sqrt(Double(d)))/2*Double(a)
            let x2: Double = ((Double(-b))-sqrt(Double(d)))/2*Double(a)
            print("first root: \(x1), second root: \(x2)")
        }
    } else if (c == 0) {
        let x1 = 0
        let x2 = (-b)/a
        print(x1,x2)
    } else if (b == 0) && ((a>0)&&(c<0) || (a<0)&&(c>0)) {
        let x = sqrt(Double(Double(-c)/Double(a)))
        print ("first root: +\(x), second root: -\(x)")
    }
} else { print ("Input Error. It's not a quadratic equation if a=0!") }

// Second Program
var leg1:Double = 3
var leg2:Double = 5

let hypotenuse:Double = leg1*leg1 + leg2*leg2
let s:Double = (leg1*leg2)/2
let p:Double = leg1+leg2+hypotenuse
print ("Hypotenuse: \(hypotenuse)")
print ("Squre: \(s)")
print ("Perimeter: \(p)")


// Third Program
var count: Double = 10000
var percent: Double = 12.5
var i = 1

while i<6 {
    i += 1
    count = count + (count*percent)/100
}

print ("The result, after five years is: \(round(count))")

