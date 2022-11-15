//
//  CharacterDetailsViewModel.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 15/11/22.
//

import UIKit

protocol CharacterDetailsDelegate: AnyObject {
    func sucess()
    func error(_ message: String)
}

class CharacterDetailsViewModel {
    private let service: CharacterService = CharacterService()
    var characterDetails: MarvelCharacter?
    private weak var delegate: CharacterDetailsDelegate?
    public func characterDetailsDelegate(delegate: CharacterDetailsDelegate?) {
        self.delegate = delegate
    }
    
    func fetchCharacterDetails(withId id: Int) {
        service.getDetailsCharacter(fromCharacterId: id) { sucess, error in
            if let sucess = sucess {
                self.characterDetails = sucess
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
}

