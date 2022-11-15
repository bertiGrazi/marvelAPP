//
//  CharacterDetailsViewController.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 15/11/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    //MARK: - Variable
    var detailViewModel: CharacterDetailsViewModel?
    var characterModel: MarvelCharacter?
    
    //MARK: - View
    lazy var nameChacarterLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.primaryTextColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionChacarterLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.primaryTextColor
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailViewModel?.characterDetailsViewModelDelegate(delegate: self)
        detailViewModel?.fetchDetailsCharacter()
        
        setupData()
        setupLayout()
        setupLayoutConstrains()
    }
    
    fileprivate func setupData() {
        guard let characterModel = characterModel else {
            return
        }
        
        self.nameChacarterLabel.text = characterModel.name
        self.descriptionChacarterLabel.text = characterModel.resultDescription
    }
    
    fileprivate func setupLayout() {
        view.addSubview(nameChacarterLabel)
        view.addSubview(descriptionChacarterLabel)
    }
    
    fileprivate func setupLayoutConstrains() {
        NSLayoutConstraint.activate([
            nameChacarterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            nameChacarterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            descriptionChacarterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            descriptionChacarterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            descriptionChacarterLabel.topAnchor.constraint(equalTo: nameChacarterLabel.bottomAnchor, constant: 8),
        ])
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewModelDelegate {
    func sucess() {
        print("CharacterDetailsViewController: deu certo")
    }
    
    func error(_ message: String) {
        print("CharacterDetailsViewController: deu ruim \(message)")
    }
}
