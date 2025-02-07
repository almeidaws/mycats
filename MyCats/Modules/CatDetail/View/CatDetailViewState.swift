//
//  CatDetailViewState.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

enum CatDetailViewState {
    case loading
    case ready
    case error(_ error: Error)
}
