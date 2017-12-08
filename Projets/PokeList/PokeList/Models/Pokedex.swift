//
//  Pokedex.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 07/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//

import Foundation

class Pokedex: Codable {

    static let shared: Pokedex = Pokedex()

    private init() {
        pokemons = []
    }

    var pokemons: [Pokemon]

    func add(_ p: Pokemon) {
        pokemons.append(p)

        notifyChanges()

        let prefs = UserDefaults.standard
        prefs.set(p.name, forKey: "lastAddedPokemon")

        save()
    }

    func list() -> [Pokemon] {
        return pokemons
    }

    func remove(_ p: Pokemon) {
        guard let index = pokemons.index(of: p) else { return }
        pokemons.remove(at: index)
        save()
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

    func save() {

        let encoder = JSONEncoder()

//        do {
//            let data = try encoder.encode(self)
//        } catch {
//            print(error.localizedDescription)
//        }

        if let data = try? encoder.encode(self) {

            //Save to disk
        }
    }

    static func savedData(data: Data) {

        let decoder = JSONDecoder()
        //Read from disk
        guard let dex = try? decoder.decode(Pokedex.self, from: data) else { return }
        print(dex.list().first?.name)
    }

    private func notifyChanges() {

        let notCenter = NotificationCenter.default
        notCenter.post(name: Notification.Name("modelChanged"), object: self)
    }
}
