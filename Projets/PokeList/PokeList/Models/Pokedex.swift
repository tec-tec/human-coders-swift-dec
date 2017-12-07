//
//  Pokedex.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 07/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//

import Foundation

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
