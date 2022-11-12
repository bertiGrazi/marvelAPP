//
//  Character.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import Foundation

struct APIResult: Codable {
    var data: [APICharacterData]
}

struct APICharacterData: Codable {
    var count: Int
    var result: [Character]
}

struct Character: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String:String]
    var urls: [[String:String]]
}
