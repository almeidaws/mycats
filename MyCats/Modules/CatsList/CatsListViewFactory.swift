//
//  CatsListViewFactory.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

enum CatsListViewFactory {
    static func build() -> some View {
        let viewModel = CatsListNetworkViewModel()
        let view = CatsListView(viewModel: viewModel)
        return view
    }
}
