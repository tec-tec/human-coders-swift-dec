//
//  PokemonDetailsViewController.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 08/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    var pokemonToDisplay: Pokemon?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = pokemonToDisplay?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
