//
//  Requester+Error.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

extension Requester {
    enum Error: Swift.Error, CustomDebugStringConvertible {
        case network(_ error: Swift.Error)
        case decoding(_ error: Swift.Error)
        
        var debugDescription: String {
            switch self {
            case .network(let error):
                return "Network error: \(error.localizedDescription)"
            case .decoding(let error):
                return "Decoding error: \(error.localizedDescription)"
            }
        }
    }
}
