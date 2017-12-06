//: Playground - noun: a place where people can play

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

struct Pokemon {

    enum PokemonType {
        case fire
        case water
        case electric
        case unknown
    }

    let name: String

    //Stored property
    var level: Int

    //Computed property (get-only)
    var force: Float {
        return Float(level) * 1.5
    }

    // Observed stored property
    var isCaptured: Bool {
        willSet {
            isCaptured //false
            newValue // true
        }

        didSet {
            if isCaptured {
                captureLocation = Coordinate(latitude: 0.0, longitude: 0.0)
                captureDate = Date()
            } else {
                captureLocation = nil
                captureDate = nil
            }
        }
    }

    // Stored properties with private set (can't be modified outside of the Pokemon type)
    private(set) var captureLocation: Coordinate?
    private(set) var captureDate: Date?

    var weight: Float
    let type: PokemonType

    // Mutating indicates that the method will mutate the instance
    // Mutating func can't be called on let instances
    mutating func levelUp() {
        level = level + 1
    }
}

class Pokedex {

    var pokemons = [Pokemon]()

    func add(_ p: Pokemon) {
        pokemons.append(p)
    }

    func list() -> [Pokemon] {
        return pokemons
    }

    func remove(_ p: Pokemon) {

    }

    func listOrderedByName() -> [Pokemon] {
        return pokemons
    }
}

// Tri
// Remove (vérifier l'égalité en pokemons)
// Coller une interface !

let pika = Pokemon(name: "Pikachu", level: 10, isCaptured: false, captureLocation: nil, captureDate: nil, weight: 7.9, type: .electric)

pika.captureDate
pika.isCaptured = true
//pika.captureDate = nil
pika.captureDate
pika.isCaptured = false
pika.captureDate

pika.levelUp()
