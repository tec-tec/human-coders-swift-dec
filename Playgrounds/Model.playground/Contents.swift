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


    var captureLocation: Coordinate?
    var captureDate: Date?
    var weight: Float
    let type: PokemonType

    func levelUp() {
        //To Do
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

// Computed properties
// Tri
// Remove (vérifier l'égalité en pokemons)
// Coller une interface !
