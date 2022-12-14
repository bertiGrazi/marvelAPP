//
//  Character.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import Foundation

import Foundation

// MARK: - MarvelInfo
struct MarvelInfo: Codable {
    let code: Int?
    let status, copyright, attributionText: String?
    let attributionHTML: String?
    let data: MarvelData?
    let etag: String?
}

// MARK: - DataClass
struct MarvelData: Codable {
    let offset, limit, total, count: Int?
    let results: [MarvelCharacter]?
}

// MARK: - Result
struct MarvelCharacter: Codable {
    let id: Int?
    let name, resultDescription, modified: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events, series: Comics?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, resourceURI, urls, thumbnail, comics, stories, events, series
    }
}

// MARK: - Comics
struct Comics: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI, name: String?
}

// MARK: - Stories
struct Stories: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path, thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type, url: String?
}
