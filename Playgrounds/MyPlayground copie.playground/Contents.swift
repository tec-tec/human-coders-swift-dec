//: Playground - noun: a place where people can play

import Foundation

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

//: ## Enums

//Raw values (String/Character/Int/Double/Float)
enum PokemonType: String {
    case water = "eau"
    case fire
    case electric = "⚡️"
    case unknown
}

let typeElectric = PokemonType.electric

let stringType = "eau"
let t = PokemonType(rawValue: stringType)
typeElectric.rawValue

struct Position {

}

//Associated values
enum CapturedState {
    case captured (captureDate: Date, capturePosition: Position)
    case notCaptured

    func stringValue() -> String {
        switch self {
        case .captured:
        return "Capturé"
        case .notCaptured:
            return "Non capturé"
        }
    }
}

var cap = CapturedState.notCaptured
cap.stringValue()
let now = Date()
let here = Position()

cap = .captured(captureDate: now, capturePosition: here)
cap.stringValue()

//: ## Optionals

var nbHabitants = ["Paris" : 2250000, "Bordeaux" : 239000, "Lyon" : 491268, "Marseille" : 850636]

// If-Let récupère, test, et déballe si valeur il y a
if let r = nbHabitants["Lyon"] {
    r * 2
} else {
    print("Pas de valeurs pour la population")
}

if let type = PokemonType(rawValue: "eau") {
    type
} else {

}

guard let hab = nbHabitants["Lyon"] else { fatalError() }
hab * 2

//Nil coalesing operator (fournir des valeurs par défaut si == nil)
// TYPE = TYPE? ?? TYPE
let type2 = PokemonType(rawValue: "") ?? .unknown



//: ## Modèle


class Pokemon {

    var name: String = "Pikachu"
}

class Pokedex {

    var firstPokemon: Pokemon?
}

let dex = Pokedex()
//dex.firstPokemon = Pokemon()

if let nameOfMyFirstPokemon = dex.firstPokemon?.name {
    print("Mon premier pokemon est \(nameOfMyFirstPokemon)")
}

let latitude = Double(arc4random_uniform(900000)) / 10000.0
let longitude = Double(arc4random_uniform(180000)) / 10000.0

let today = Date()

var villes = ["Paris","Bordeaux","Lyon","Marseille"]

nbHabitants["Paris"]
villes[2]

villes.append("Lille")
nbHabitants["Lille"] = 10
nbHabitants["Lille"] = 100
nbHabitants

nbHabitants.removeValue(forKey: "Lille")

// list -> Array
// map -> Dictionary
// set -> Set

let citiesIveBeen: Set = ["Bordeaux", "Paris", "San Francisco"]

var cities: Set<String> = []
cities.insert("Paris")
cities.insert("Paris")
cities




let count = villes.count

for i in 0...10 {
    print(i)
}

for ville in villes {
    print(ville)
}

for v in citiesIveBeen {
    print(v)
}

for (ville, hab) in nbHabitants {
    print(ville)
    print(hab)
}

for c in "Hello le monde" {
    print(c)
}

let majeur = true

guard majeur else {
    fatalError("Tu es trop jeune")
}

print("test")





func something(with age: Int?) {

    guard let a = age else { return }

    let maj: Bool
    if a < 18 {
        maj = false
    } else {
        maj = true
    }

    maj
    print(a * 25)
}


something(with: nil)











