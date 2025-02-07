//
//  CATAAS+URLBuilder.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

extension CATAAS {
    enum URLBuilder {
        private static let host = URL(string: "https://cataas.com")!

        static func cats(limit: Int = 10, skip: Int = 0, filteringByTags tags: [String]? = nil) -> URL {
            let url = host
                .appending(path: "/api/cats")
                .appending(queryItems: [
                    .init(name: "limit", value: limit.description),
                    .init(name: "skip", value: skip.description),
                ])
            
            if let tags = tags, !tags.isEmpty {
                return url.appending(queryItems: [.init(name: "tags", value: tags.joined(separator: ","))])
            }
            
            return url
        }
        
        static func cat(id: String) -> URL {
            let url = host
                .appending(path: "/cat/\(id))")
                 
            return url
        }
    }
}
