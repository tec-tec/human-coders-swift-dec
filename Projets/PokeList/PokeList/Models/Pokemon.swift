//
//  Pokemon.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 07/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//

import Foundation

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
