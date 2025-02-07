//
//  CATAAS+Error.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

extension CATAAS {
    enum Error: Swift.Error {
        case imageDecoding
        
        var debugDescription: String {
            switch self {
            case .imageDecoding:
                return "Couldn't decode image from server."
            }
        }
    }
}
