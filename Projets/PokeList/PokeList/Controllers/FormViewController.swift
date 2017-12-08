//
//  ViewController.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 06/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//


import UIKit

class FormViewController: UIViewController {

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
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions

    @IBAction func sliderValueChanged(_ sender: UISlider) {

        let rounded = round(sender.value)
        sender.value = rounded
        levelLabel.text = "\(Int(rounded))"
    }

    @IBAction func save(_ sender: Any) {

        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let type = Pokemon.PokemonType(rawValue: styleSegmentedControl.selectedSegmentIndex) else { return }
        let level = Int(round(levelSlider.value))
        let captured = isCapturedSwitch.isOn
        guard let weightString = weightTextField.text, let weight = Float(weightString) else { return }

        let newPokemon = Pokemon(name: name, level: level, isCaptured: captured, captureLocation: nil, captureDate: nil, weight: weight, type: type)
        dex.add(newPokemon)

        print(dex.list())
    }

    @IBAction func backTapped(_ sender: Any) {

        view.endEditing(false)
    }

    //MARK: - Private methods
    private func configureUI() {

        //Remove all previous segments
        styleSegmentedControl.removeAllSegments()

        //Add segments from the enum
        for type in Pokemon.PokemonType.allTypes {
            styleSegmentedControl.insertSegment(withTitle: type.emojiValue, at: type.rawValue, animated: false)
        }

        //Select the "unknown" type by default
        styleSegmentedControl.selectedSegmentIndex = Pokemon.PokemonType.unknown.rawValue

    styleSegmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:styleSegmentedControl.tintColor], for: .selected)
    }
}





