//
//  ViewController.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 06/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var isCapturedSwitch: UISwitch!
    @IBOutlet weak var weightTextField: UITextField!

    var dex = Pokedex()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions

    @IBAction func sliderValueChanged(_ sender: Any) {
        
    }

    @IBAction func save(_ sender: Any) {

    }
}





