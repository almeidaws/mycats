//
//  CatResponse.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

struct CatResponse: Decodable {
    let id: String
    let tags: [String]
}
