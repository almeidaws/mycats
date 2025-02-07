//
//  CatModel.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import Foundation

struct CatModel: Decodable {
    let id: String
    let tags: [String]
    let createdAt: Date
}
