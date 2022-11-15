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
    private var data: MarvelData?
    private var idCharacter: Int = 1011334
    
    public func characterViewModelDelegate(delegate: CharacterViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchAllCharacter() {
        self.service.getAllCharater { sucess, error in
            if let sucess = sucess {
                self.data = sucess.data
                self.delegate?.sucess()
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
    
    public func fetchDetailsCharacter() {
        self.service.getDetailsCharacter(id: idCharacter) { sucess, error in
            if let sucess = sucess {
                self.delegate?.sucess()
            } else {
                self.delegate?.error(error?.localizedDescription ?? "")
            }
        }
    }
    
    public var numberOfRow: Int {
        return data?.results?.count ?? 0
    }
    
    public func titleForCell(indexPath: IndexPath) -> String {
        return  data?.results?[indexPath.row].name ?? ""
    }
}
