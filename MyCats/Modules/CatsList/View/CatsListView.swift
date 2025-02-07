//
//  CatsListView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct CatsListView: View {
    
    private static let titleText = "Cats"
    
    @State var viewModel: CatsListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.cats) { cat in
                NavigationLink(
                    destination: CatViewFactory.build(cat), 
                    label: { Row(cat: cat) }
                )
            }
        }
        .navigationTitle(CatsListView.titleText)
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $viewModel.searchString)
    }
}

fileprivate struct Row: View {
    
    private static let imageSide: CGFloat = 48
    
    let cat: CatModel
    
    var body: some View {
        HStack {
            Image(systemName: "cat.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Row.imageSide, height: Row.imageSide)
            TagCloudView(tags: cat.tags)
        }
    }
}

#Preview {
    NavigationView {
        CatsListView(viewModel: .init(cats: .samples))
    }
}
