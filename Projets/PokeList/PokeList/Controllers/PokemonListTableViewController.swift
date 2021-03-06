//
//  PokemonListTableViewController.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 08/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//

import UIKit

class PokemonListTableViewController: UITableViewController {

    let dex = Pokedex.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        let notCenter = NotificationCenter.default
        notCenter.addObserver(forName: Notification.Name("modelChanged"), object: dex, queue: OperationQueue.main) { (notif) in
            self.tableView.reloadData()
        }

        let prefs = UserDefaults.standard
        let str = prefs.string(forKey: "lastAddedPokemon")
        print(str)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dex.list().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)

        // Configure the cell...
        let currentPokemon = dex.list()[indexPath.row]

        cell.textLabel?.text = currentPokemon.name
        cell.detailTextLabel?.text = "Niveau : \(currentPokemon.level)"
        let color = currentPokemon.type.color
        cell.backgroundColor = UIColor(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: 1)

        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source

            let currentPokemon = dex.list()[indexPath.row]
            dex.remove(currentPokemon)
            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showDetails" {

            guard let dest = segue.destination as? PokemonDetailsViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }

            let pokemon = dex.list()[indexPath.row]
            dest.pokemonToDisplay = pokemon
        }


    }


}
