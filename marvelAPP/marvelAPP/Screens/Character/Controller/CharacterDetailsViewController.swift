//
//  CharacterDetailsViewController.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 15/11/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    let viewModel = CharacterDetailsViewModel()
    let characterId: Int
    
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
    
    init(id: Int) {
        self.characterId = id
        viewModel.fetchCharacterDetails(withId: characterId)
        
        super.init(nibName: nil, bundle: nil)
        
        viewModel.characterDetailsDelegate(delegate: self)
        
        setupLayout()
        setupLayoutConstrains()
        setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData() {
        self.nameChacarterLabel.text = viewModel.characterDetails?.name
        self.descriptionChacarterLabel.text = viewModel.characterDetails?.resultDescription
    }
    
    fileprivate func setupLayout() {
        view.addSubview(nameChacarterLabel)
        view.addSubview(descriptionChacarterLabel)
    }
    
    fileprivate func setupLayoutConstrains() {
        NSLayoutConstraint.activate([
            self.nameChacarterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            self.nameChacarterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            self.descriptionChacarterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            self.descriptionChacarterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            self.descriptionChacarterLabel.topAnchor.constraint(equalTo: nameChacarterLabel.bottomAnchor, constant: 8),
        ])
    }

}

extension CharacterDetailsViewController: CharacterDetailsDelegate {
    func sucess() {
        print("deu certo")
        
    }
    
    func error(_ message: String) {
        print("deu errado")
    }
}
