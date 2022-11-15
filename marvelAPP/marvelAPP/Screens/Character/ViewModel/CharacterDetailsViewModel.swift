//
//  CharacterDetailsViewModel.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 15/11/22.
//

import UIKit

protocol CharacterDetailsViewModelDelegate: AnyObject {
    func sucess()
    func error(_ message: String)
}

class CharacterDetailsViewModel {
    private let service: CharacterService = CharacterService()
    private weak var delegate: CharacterDetailsViewModelDelegate?
    private var data: MarvelData?
    private var idCharacter: String?
    
    //MARK:- Initializer
    init(id: String) {
        self.idCharacter = id
    }
    
    public func characterDetailsViewModelDelegate(delegate: CharacterDetailsViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchDetailsCharacter() {
        self.service.getDetailsCharacter() { sucess, error in
            if let sucess = sucess {
                self.data = sucess.data
                self.delegate?.sucess()
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
}
