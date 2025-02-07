//
//  SearchableTextFieldView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct SearchableTextFieldView: View {
    
    private static let padding: CGFloat = 8
    private static let cornerRadius: CGFloat = 8
    private static let lineWidth: CGFloat = 1
    
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "text.bubble")
                .renderingMode(.template)
                .foregroundStyle(.secondary)
            TextField(title, text: $text)
            
        }
        .padding(SearchableTextFieldView.padding)
        .roundedBorder(
            cornerRadius: SearchableTextFieldView.cornerRadius,
            style: .secondary,
            lineWidth: SearchableTextFieldView.lineWidth
        )
    }
}

#Preview {
    SearchableTextFieldView(title: "Text to be added inside the image", text: .constant(""))
        .padding(.horizontal, 20)
}
