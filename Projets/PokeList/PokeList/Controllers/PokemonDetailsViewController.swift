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

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = pokemonToDisplay?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func network(_ sender: Any) {
        let url = URL(string: "https://auto.ndtvimg.com/car-images/colors/maruti-suzuki/swift/maruti-suzuki-swift-silky-silver.png")!

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in

            guard let imgData = data, let img = UIImage(data: imgData) else { return }

            DispatchQueue.main.async {
                self.imageView.image = img
            }
        }

        task.resume()
    }

    @IBAction func takePhoto(_ sender: Any) {

        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera

        present(picker, animated: true, completion: nil)
    }
}

extension PokemonDetailsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
}
