//
//  CATAASCaching.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import SwiftUI

struct CATAASCaching {
    
    private static let queue = DispatchSerialQueue(label: "com.gustavoamaral.mycats.caching", qos: .userInitiated)
    
    private static var imageCache = [String: Data]()
    
    static func insertImage(_ data: Data, at key: String) async {
        return await withCheckedContinuation { continuation in
            queue.async {
                imageCache[key] = data
                continuation.resume(returning: ())
            }
        }
    }
    
    static func getImage(from key: String) async -> Data? {
        return await withCheckedContinuation { continuation in
            queue.async {
                let value = imageCache[key]
                continuation.resume(returning: value)
            }
        }
    }
    
    static func cleanCachedImages() {
        imageCache.removeAll()
    }
    
    private init() { }
}
