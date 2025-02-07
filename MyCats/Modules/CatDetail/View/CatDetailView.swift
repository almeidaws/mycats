//
//  CatDetailView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

fileprivate let horizontalPadding: CGFloat = 20
fileprivate let textFieldHintText = "Text to be added inside the image"
fileprivate let textFieldBottomPadding: CGFloat = 16
fileprivate let loadingViewHeight: CGFloat = 200
fileprivate let imageCornerRadius: CGFloat = 8

struct CatDetailView<ViewModel>: View where ViewModel: CatDetailViewModel {
    
    @StateObject var viewModel: ViewModel
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        switch viewModel.viewState {
        case .ready, .loading:
            contentView
        case .error(let error):
            ErrorView(error: error) {
                Task { await viewModel.requestImage() }
            }
        }
    }
    
    private var contentView: some View {
        ScrollView {
            VStack {
                switch viewModel.viewState {
                case .loading:
                    LoadingView()
                        .frame(height: loadingViewHeight)
                        .onAppear { Task { await viewModel.requestImage() } }
                default:
                    viewModel.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius))
                }
                
                    
                TagCloudView(tags: viewModel.cat.tags)
                
                Spacer()
            }
            .padding(.horizontal, horizontalPadding)
        }
        .onAppear { isTextFieldFocused = true }
        .scrollDismissesKeyboard(.interactively)
        .toolbar {
            if let catImage = viewModel.shareableImageURL {
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: catImage)
                }
            }
        }
    }
}

#Preview {
    CatDetailView(viewModel: CatDetailPreviewViewModel())
}
