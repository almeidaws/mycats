//
//  Cat+PreviewSamples.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import Foundation

extension CatModel {
    static var sample: CatModel {
        .init(id: "04eEQhDfAL8l5nt3",
              tags: [
                "two",
                "double",
                "black"
              ],
              createdAt: .init(iso8601: "2022-07-18T11:28:29.596Z") ?? .now
        )
    }
}

extension Array where Element == CatModel {
    static var samples: [CatModel] {
        [
            .init(id: "04eEQhDfAL8l5nt3",
                  tags: [
                    "two",
                    "double",
                    "black"
                  ],
                  createdAt: .init(iso8601: "2022-07-18T11:28:29.596Z") ?? .now
                 ),
            .init(id: "05Xd4JtN14983pns",
                  tags: [
                    "Cute"
                  ],
                  createdAt: .init(iso8601: "2024-05-27T17:55:08.552Z") ?? .now
                 ),
            .init(id: "0C2bQ39x8kuhx31p",
                  tags: [
                    "sara",
                    "looking"
                  ],
                  createdAt: .init(iso8601: "2021-11-11T10:16:22.061Z") ?? .now
                 )
        ]
    }
}
