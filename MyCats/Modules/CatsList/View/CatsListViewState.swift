//
//  CatsListViewState.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

enum CatsListViewState {
    case loading
    case loadingTag
    case ready
    case error(_ error: Error)
}
