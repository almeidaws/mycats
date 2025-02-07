//
//  CatsListViewModel.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import Foundation

protocol CatsListViewModel: ObservableObject {
    
    var cats: [CatModel] { get }
    var viewState: CatsListViewState { get }
    
    func requestCats(filteringByTags tags: String?) async
    func requestMoreCats(filteringByTags tags: String?) async
    func requestImage(for cat: CatModel) async
}
