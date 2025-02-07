//
//  Service.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

enum Requester {
    static func request<Response>(_ url: URL, on queue: DispatchQueue = .main) async throws -> Response where Response: Decodable {
        let data = try await requestData(url, on: queue)
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
    static func requestData(_ url: URL, on queue: DispatchQueue = .main) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error { queue.async { continuation.resume(throwing: Requester.Error.network(error)) } }
                guard let data = data else { return }
                queue.async { continuation.resume(returning: data) }
            }.resume()
        }
    }
}
