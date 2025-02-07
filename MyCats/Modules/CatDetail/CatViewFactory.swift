//
//  CatViewFactory.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

enum CatViewFactory {
    static func build(_ cat: CatModel) -> some View {
        let viewModel = CatViewModel(cat: cat)
        let view = CatView(viewModel: viewModel)
        return view
    }
}
