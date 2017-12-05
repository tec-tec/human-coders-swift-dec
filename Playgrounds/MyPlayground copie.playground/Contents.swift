//: Playground - noun: a place where people can play

//: # Swift

//: ## Variables

let languageName: String = "Swift"

let introductionYear: Int = 2014
var version: Double = 4.0
//var version: Float = 4.0

let isAwesome: Bool = true

//: ### 1er principe : Typage fort
//: Le type des variables ne change pas
//languageName = 5

//: ### 2nd principe : Utilisation des constantes
//: Utilisation de let pour signaler des constantes (à favoriser)

//: ### 3eme principe : Type inference
//: Ne pas préciser le type quand il peut être déduit
var firstname = "Ludovic"
let birthYear = 1986

let a = 5
let b = 2

let c = Double(a) / Double(b)

//: ## Classes & structures

//: Classes & structures servent à modèliser des objets

//: Différences :
//: Les classes peuvent faire de l'héritage, pas les structures
//: Fonctionnement en mémoire différent : classes gérées par références et stuctures gérées par valeurs (copie)
//: Constructeur détaillé autogénéré dans les structures

class LivingBeing {
    var age = 0
}

class Animal: LivingBeing {
    var name = ""

    func eat() {
        print("Animal mange")
    }
}

class Fish: Animal {

    override func eat() {
        print("\(name) mange")
    }
}

var myFish = Fish()
myFish.name = "Némo"
myFish.eat()

class Dog: Animal {

    func bark() {

    }
}

struct Cat {
    var age = 0
    var name = "Médor"

    func meow() {

    }
}

let aDog = Dog()
let aSecondDog = aDog

aDog.age
aDog.age = 5
aDog.age

aSecondDog.age
//0

var 🐈 = Cat()
let 🙀 = 🐈

🐈.age
🐈.age = 5
🐈.age

🙀.age
//5

myFish.eat()


func say(_ something: String) {
    print(something)
}

say("jdgck")


func manger(_ nourriture: String = "Pizza", avec ami: String = "Paul") {

    print("Je mange de la \(nourriture) avec \(ami)")


}

manger("Pizza")
manger("Pain", avec: "Robert")

// Tuple (multiplet, n-uplet)
func sum(_ a: Int, adding b: Int) -> (op1: Int, op2: Int, sum: Int) {
    let c = a + b
    return (a, b, c)
}

let result = sum(2, adding: 3)
result.sum


struct Position {

}

class Pokemon {

}

class Pokedex {

}






















