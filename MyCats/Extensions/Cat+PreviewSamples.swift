//
//  Cat+PreviewSamples.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import Foundation

extension CatResponse {
    static var sample: CatResponse {
        .init(id: "04eEQhDfAL8l5nt3",
              tags: [
                "two",
                "double",
                "black"
              ]
        )
    }
}

extension Array where Element == CatResponse {
    static var samples: [CatResponse] {
        [
            .init(id: "04eEQhDfAL8l5nt3",
                  tags: [
                    "two",
                    "double",
                    "black"
                  ]
                 ),
            .init(id: "05Xd4JtN14983pns",
                  tags: [
                    "Cute"
                  ]
                 ),
            .init(id: "0C2bQ39x8kuhx31p",
                  tags: [
                    "sara",
                    "looking"
                  ]
                 )
        ]
    }
}
