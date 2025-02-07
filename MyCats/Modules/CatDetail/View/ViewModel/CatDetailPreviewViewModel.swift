//
//  CatDetailPreviewViewModel.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import SwiftUI

class CatDetailPreviewViewModel: CatDetailViewModel {
    let cat: CatModel = .init(
        id: CatResponse.sample.id,
        tags: CatResponse.sample.tags
    )
    var image: Image? = Image(systemName: "cat.fill")
    var viewState: CatDetailViewState = .ready
    var shareableImageURL: URL?
    
    func requestImage() async { }
}
