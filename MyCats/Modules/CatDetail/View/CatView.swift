//
//  CatView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct CatView: View {
    
    private static let horizontalPadding: CGFloat = 20
    private static let textFieldHintText = "Text to be added inside the image"
    private static let textFieldBottomPadding: CGFloat = 16
    
    @State var viewModel: CatViewModel
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                SearchableTextFieldView(title: CatView.textFieldHintText, text: $viewModel.customText)
                    .padding(.bottom, CatView.textFieldBottomPadding)
                    .focused($isTextFieldFocused)
                Image(systemName: "cat.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                TagCloudView(tags: viewModel.cat.tags)
                
                Spacer()
            }
            .padding(.horizontal, CatView.horizontalPadding)
        }
        .onAppear { isTextFieldFocused = true }
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    CatView(viewModel: .init(cat: .sample))
}
