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
    lazy var searchCharacterTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Search for Character..."
        textField.keyboardType = .alphabet
        textField.keyboardAppearance = .default
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var charactertableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifer)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        characterViewModel.characterViewModelDelegate(delegate: self)
        characterViewModel.fetchAllCharacter()
        
        charactertableView.delegate = self
        charactertableView.dataSource = self
        
        setupNavigationController()
        setupLayout()
        setupLayoutConstrains()
    }
    
    fileprivate func setupNavigationController() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryTextColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = "Character Marvel"
    }
    
    fileprivate func setupLayout() {
        view.addSubview(searchCharacterTextField)
        view.addSubview(charactertableView)
    }
    
    fileprivate func setupLayoutConstrains() {
        NSLayoutConstraint.activate([
            self.searchCharacterTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.searchCharacterTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.searchCharacterTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.searchCharacterTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.searchCharacterTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.charactertableView.topAnchor.constraint(equalTo: searchCharacterTextField.bottomAnchor),
            self.charactertableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.charactertableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.charactertableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - CharacterViewModelDelegate
extension CharactersViewController: CharacterViewModelDelegate {
    func sucess() {
        print("deu certo")
        self.charactertableView.reloadData()
    }
    
    func error(_ message: String) {
        print("deu ruim \(message)")
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterViewModel.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifer, for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        cell.configCell(title: self.characterViewModel.titleForCell(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
