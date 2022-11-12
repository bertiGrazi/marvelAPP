//
//  CharacterViewModel.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import UIKit

protocol CharacterViewModelDelegate: AnyObject {
    func sucess()
    func error(_ message: String)
}

class CharacterViewModel {
    private let service: CharacterService = CharacterService()
    private weak var delegate: CharacterViewModelDelegate?
    public func delegate(delegate: CharacterViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchAllCharacter() {
        self.service.getAllCharater { sucess, error in
            if let sucess = sucess {
                self.delegate?.sucess()
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
}
