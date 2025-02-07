//
//  CATAAS+Service.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

extension CATAAS {
    enum Service {
        static func requestImage(catId: String) async throws -> Data {
            if let cachedData = await CATAASCaching.getImage(from: catId) {
                return cachedData
            }
            
            let url = CATAAS.URLBuilder.cat(id: catId)
            let data = try await Requester.requestData(url)
            await CATAASCaching.insertImage(data, at: catId)
            return data
        }
        
        static func requestCats(limit: Int = 10, skip: Int = 0, filteringByTags tags: [String]? = nil) async throws -> [CatResponse] {
            let url = CATAAS.URLBuilder.cats(limit: limit, skip: skip, filteringByTags: tags)
            return try await Requester.request(url)
        }
    }
}
