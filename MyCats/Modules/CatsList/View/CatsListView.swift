//
//  CatsListView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

fileprivate let titleText = "Cats"
fileprivate let tryAgainText = "Try again"
fileprivate let horizontalPadding: CGFloat = 20
fileprivate let textFieldHintText = "Search cats by tag"

struct CatsListView<ViewModel>: View where ViewModel: CatsListViewModel {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        switch viewModel.viewState {
        case .ready, .loadingTags, .loadingMoreCats:
            contentView
        case .loading:
            LoadingView()
                .onAppear { Task { await viewModel.requestCats(nextPage: false) } }
        case .error(let error):
            ErrorView(error: error) {
                Task { await viewModel.requestCats(nextPage: false) }
            }
        }
    }
    
    private var contentView: some View {
        VStack {
            SearchableTextFieldView(title: textFieldHintText, text: $viewModel.tagsSearch)
                .padding(.horizontal, horizontalPadding)
            
            List {
                ForEach(viewModel.cats) { cat in
                    NavigationLink(
                        destination: CatDetailViewFactory.build(cat),
                        label: {
                            Row(cat: cat)
                                .onAppear { Task { await viewModel.requestImage(for: cat) } }
                        }
                    )
                }
                
                if viewModel.tagsSearch.isEmpty {
                    LoadingView()
                        .onAppear { Task { await viewModel.requestCats(nextPage: true) }}
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle(titleText)
        .navigationBarTitleDisplayMode(.large)
        
    }
}

fileprivate struct Row: View {
    
    private static let imageSide: CGFloat = 48
    private static let cornerRadius: CGFloat = 8
    
    let cat: CatModel
    
    var body: some View {
        HStack {
            (cat.image ?? Image(systemName: "cat.fill"))
                .resizable()
                .aspectRatio(contentMode: cat.image == nil ? .fit : .fill)
                .frame(width: Row.imageSide, height: Row.imageSide)
                .clipShape(RoundedRectangle(cornerRadius: Row.cornerRadius))
            TagCloudView(tags: cat.tags.prefix(3).map { $0 })
        }
    }
}

#Preview {
    NavigationView {
        CatsListView(viewModel: CatsListPreviewViewModel())
    }
}
