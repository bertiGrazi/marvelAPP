//
//  CharacterService.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import UIKit
import Alamofire
import CryptoKit

protocol CharacterServiceDelegate: GenericService {
    func getAllCharater(completion: @escaping completion<MarvelInfo?>)
    func getDetailsCharacter(fromCharacterId id: Int, completion: @escaping completion<MarvelCharacter?>)
}

class CharacterService: CharacterServiceDelegate{
    let publicKey: String = "90d29bf191cccadaa1b1f3cbef76519d"
    let privateKey: String = "b5507ae92198ad027e531e59f202e709dca828c5"
    
    func getAllCharater(completion: @escaping completion<MarvelInfo?>) {
        let ts = String(Date().timeIntervalSince1970)
        let hash = generateHash("\(ts)\(privateKey)\(publicKey)")
        let url: String = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: MarvelInfo.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let sucess):
                print("SUCESS -> \(#function)")
                completion(sucess, nil)
            
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorReques(error))
            }
        }
    }
    
    func getDetailsCharacter(fromCharacterId id: Int, completion: @escaping completion<MarvelCharacter?>) {
        //https://gateway.marvel.com:443/v1/public/characters/1011334?apikey=90d29bf191cccadaa1b1f3cbef76519d
        let ts = String(Date().timeIntervalSince1970)
        let hash = generateHash("\(ts)\(privateKey)\(publicKey)")
        let url: String = "https://gateway.marvel.com:443/v1/public/characters/\(id)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: MarvelCharacter.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let sucess):
                print("SUCESS -> \(#function)")
                completion(sucess, nil)
            
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorReques(error))
            }
        }
    }
    
    func generateHash(_ data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
}
