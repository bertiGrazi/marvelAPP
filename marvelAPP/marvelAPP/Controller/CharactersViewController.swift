//
//  ViewController.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import UIKit

class CharactersViewController: UIViewController {
    //MARK: - Variable
    let characterViewModel: CharacterViewModel = CharacterViewModel()
    
    //MARK: View

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        characterViewModel.delegate(delegate: self)
        characterViewModel.fetchAllCharacter()
    }
}

extension CharactersViewController: CharacterViewModelDelegate {
    func sucess() {
        print("deu certo")
    }
    
    func error(_ message: String) {
        print("deu ruim \(message)")
    }
}
