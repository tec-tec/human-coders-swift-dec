//: Playground - noun: a place where people can play

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

protocol Mappable {

    var coordinates: Coordinate { get }
    var name: String { get }
}

protocol AddressConvertible {
    var coordinates: Coordinate { get }
    var address: String { get set }

    func validate()
}

struct Pokestop: Mappable {

    var coordinates: Coordinate
    var name: String
}

struct Pokemon: Equatable, Mappable {

    static let maxLevel = 99

    var coordinates: Coordinate {
        return captureLocation ?? Coordinate(latitude: 0.0, longitude: 0.0)
    }

    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        if lhs.name == rhs.name && lhs.level == rhs.level && lhs.type == rhs.type && lhs.weight == rhs.weight {
            return true
        } else {
            return false
        }
    }

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
        guard level < Pokemon.maxLevel else { return }
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
        guard let index = pokemons.index(of: p) else { return }
        pokemons.remove(at: index)
    }

    func listOrderedByName() -> [Pokemon] {

        // Utilisation d'un closure de tri
        let sortedPokemons = pokemons.sorted { (p1, p2: Pokemon) -> Bool in
            //Code de tri
            let areOrdered = p1.name < p2.name
            return areOrdered
        }

        return sortedPokemons
    }
}

// Coller une interface !

var pika = Pokemon(name: "Pikachu", level: 10, isCaptured: false, captureLocation: nil, captureDate: nil, weight: 7.9, type: .electric)
var cara = Pokemon(name: "Carapuce", level: 10, isCaptured: false, captureLocation: nil, captureDate: nil, weight: 7.9, type: .electric)
var sala = Pokemon(name: "Salameche", level: 10, isCaptured: false, captureLocation: nil, captureDate: nil, weight: 7.9, type: .electric)
var rondou = Pokemon(name: "Rondoudou", level: 10, isCaptured: false, captureLocation: nil, captureDate: nil, weight: 7.9, type: .electric)

let dex = Pokedex()
dex.add(pika)
dex.add(cara)
dex.add(sala)
dex.add(rondou)

let tabPokemon = dex.list()
dex.listOrderedByName()

