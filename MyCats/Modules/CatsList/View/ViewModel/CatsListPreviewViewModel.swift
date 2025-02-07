//
//  CatsListPreviewViewModel.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

class CatsListPreviewViewModel: CatsListViewModel {
    var cats: [CatModel] = [CatResponse].samples.map { .init(
        id: $0.id,
        tags: $0.tags,
        image: nil
    ) }
    var viewState: CatsListViewState = .ready
    
    func requestCats(filteringByTags tags: String?) async { }
    func requestImage(for cat: CatModel) async { }
}
