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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions

    @IBAction func showTextFieldContent(_ sender: UIButton) {
        nameTextField.text = "Hello"
        sender.backgroundColor = UIColor.red
    }
}
