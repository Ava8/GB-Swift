//: Playground - noun: a place where people can play

import Foundation

enum Gender {
    case male, female
}

struct BirthDay {
    var day: Int
    var mounth : Int
    var year : Int
}

class User {
    var name: String = ""
    var gender: Gender
    var birthDay: BirthDay
    
    static var userCount = 0
    
    init(name: String, gender: Gender, birthDay: BirthDay) {
        self.name = name
        self.gender = gender
        self.birthDay = birthDay
        
        User.userCount += 1
    }
    
    deinit {
        User.userCount -= 1
    }
    
    static func countInfo() {
        print("Exist \(self.userCount) users.")
    }
    
    func howOldAreYou() {
        let age = 2018 - birthDay.year
        print("\(name)'s age is: \(age)")
    }
    
    func printInfo() {
        print("Here is some information about \(name): gender: \(gender), Birth Day: \(birthDay.day).\(birthDay.mounth).\(birthDay.year)")
        print(howOldAreYou())
    }
    
}

class ProfileAboutMe: User {
    var hobbie : String
    var myFavoriteBook : String
    var myFavoriteFilm : String
    var myFavoriteMusic : String
    var myFavoriteFood: String

    init(name: String, gender: Gender, birthDay: BirthDay, hobbie: String, myFavoriteBook: String, myFavoriteFilm: String, myFavoriteMusic: String, myFavoriteFood: String) {
        self.hobbie = hobbie
        self.myFavoriteBook = myFavoriteBook
        self.myFavoriteFilm = myFavoriteFilm
        self.myFavoriteMusic = myFavoriteMusic
        self.myFavoriteFood = myFavoriteFood
        
        super.init(name: name, gender: gender, birthDay: birthDay)
    }
    
    override func printInfo() {
        super.printInfo()
        print("And here is some information about \(name)'s favorite things: Hobbie is: \(hobbie), Favorite Book is: \(myFavoriteBook), Favorite Film is: \(myFavoriteFilm), Favorite Music is: \(myFavoriteMusic), Favorite Food is: \(myFavoriteFood)")
    }
    
}

class ProfileForJobSearching : User {
    var education : String
    var speciality : String
    var experience : String
    
    init(name: String, gender: Gender, birthDay: BirthDay, education: String, speciality: String, experience: String) {
        self.education = education
        self.speciality = speciality
        self.experience = experience
        
        super.init(name: name, gender: gender, birthDay: birthDay)
    }
    
    func addExperience(newExperience: String) {
        self.experience = experience + "," + newExperience
    }
    
    override func printInfo() {
        super.printInfo()
        print ("\(name)'s education: \(education), speciality: \(speciality), experience: \(experience)")
    }
}

var user1 = ProfileForJobSearching(name: "Susan", gender: .female, birthDay: .init(day: 16, mounth: 4, year: 1994), education: "HSE", speciality: "Technology development and maintenance of the software product", experience: "Mobile app developer: 'Note+', 'Quip'")
user1.printInfo()
user1.addExperience(newExperience: "Mobile iOS developer at Yandex (2015-2017)")
user1.printInfo()

var user2 = ProfileAboutMe(name: "Alex", gender: .male, birthDay: .init(day: 5, mounth: 1, year: 1998), hobbie: "Skateboarding", myFavoriteBook: "'Сrime and punishment' F.M.Dostoevsky", myFavoriteFilm: "Blade Runner 2049", myFavoriteMusic: "Alternative", myFavoriteFood: "Pelmeni")
user2.printInfo()

print(User.countInfo())









