//
//  CatDetailViewModel.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import SwiftUI

protocol CatDetailViewModel: ObservableObject {
    var cat: CatModel { get }
    var image: Image? { get }
    var viewState: CatDetailViewState { get }
    var shareableImageURL: URL? { get }
    
    func requestImage() async
}
