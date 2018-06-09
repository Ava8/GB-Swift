//: Playground - noun: a place where people can play

import Foundation

// к сожалению, не придумала никаких конкретных функций для моей программы, но как реализовывать их поняла

protocol fullNameOfObject {
    var fullName : String {get}
}
extension fullNameOfObject {
    var release : Int {return self as! Int}
}

class Music: fullNameOfObject {
    var musician : String
    var songName : String
    
    var release: Int
    
    init(musician: String, songName: String, release: Int) {
        self.musician = musician
        self.songName = songName
        self.release = release
    }
    
    var fullName: String {
        return ("'\(songName)'" + " ") + musician
    }
    
}

let myFavoriteSong = Music(musician: "Bitting Elbows", songName: "Love Song", release: 2017)
print(myFavoriteSong.fullName)

extension Music: CustomStringConvertible {
    var description : String {
        return "My favorite song is \(fullName), release: \(release)"
    }
}

print(myFavoriteSong.description)

class Car: fullNameOfObject {
    var brand: String
    var model: String
    var release: Int

    init(brand: String, model: String, release: Int) {
        self.brand = brand
        self.model = model
        self.release = release
    }
    
    var fullName: String {
        return (brand + " ") + model
    }
}

let myCar = Car(brand: "BMW", model: "x6", release: 2016)
print(myCar.fullName)

extension Car: CustomStringConvertible {
    var description : String {
        return "My car is \(fullName), release: \(release)"
    }
}

print(myCar.description)


