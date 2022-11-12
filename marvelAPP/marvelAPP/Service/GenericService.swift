//
//  GenericService.swift
//  marvelAPP
//
//  Created by Grazi  Berti on 12/11/22.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case errorReques(AFError)
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

