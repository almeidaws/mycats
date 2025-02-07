//
//  Date+ISO8601.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import Foundation

extension Date {
    init?(iso8601: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        guard let date = formatter.date(from: iso8601) else { return nil }
        self = date
    }
}
