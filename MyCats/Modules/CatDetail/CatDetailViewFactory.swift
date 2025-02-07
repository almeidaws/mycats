//
//  CatDetailViewFactory.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

enum CatDetailViewFactory {
    static func build(_ cat: CatModel) -> some View {
        let viewModel = CatDetailNetworkViewModel(cat)
        let view = CatDetailView(viewModel: viewModel)
        return view
    }
}
