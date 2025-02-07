//
//  CatDetailNetworkViewModel.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

class CatDetailNetworkViewModel: CatDetailViewModel {
    let cat: CatModel
    @Published var viewState: CatDetailViewState = .loading
    @Published var image: Image?
    @Published var shareableImageURL: URL?
    
    init(_ cat: CatModel) {
        self.cat = cat
        self.shareableImageURL = CATAAS.URLBuilder.cat(id: cat.id)
    }
    
    @MainActor
    func requestImage() async {
        viewState = .loading
        do {
            let data = try await CATAAS.Service.requestImage(catId: cat.id)
            guard let uiImage = UIImage(data: data) else {
                viewState = .error(CATAAS.Error.imageDecoding)
                return
            }
            self.image = Image(uiImage: uiImage)
            viewState = .ready
        } catch {
            viewState = .error(CATAAS.Error.imageDecoding)
        }
    }
}
