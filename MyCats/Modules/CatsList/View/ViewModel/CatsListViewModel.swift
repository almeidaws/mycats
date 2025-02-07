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
    var tagsSearch: String { get set }
    
    func requestCats(nextPage: Bool) async
    func requestImage(for cat: CatModel) async
}
