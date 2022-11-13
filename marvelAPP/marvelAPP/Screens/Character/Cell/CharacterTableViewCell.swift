//
//  CharacterTableViewCell.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    //MARK: - Variable
    static let identifer: String = "CharacterTableViewCell"
    
    //MARK: - View
    lazy var nameChacarterLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.primaryTextColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        contentView.backgroundColor = .black
        
        setupLayout()
        setupLayoutConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.contentView.addSubview(nameChacarterLabel)
    }
    
    private func setupLayoutConstrains() {
        NSLayoutConstraint.activate([
            nameChacarterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameChacarterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
        ])
    }
    
    func configCell(title: String) {
        self.nameChacarterLabel.text = title
    }
}
