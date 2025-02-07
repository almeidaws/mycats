//
//  TagView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct TagView: View {
    
    private static let padding: CGFloat = 8
    private static let cornerRadius: CGFloat = 8
    private static let lineWidth: CGFloat = 1
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.caption)
            .padding(TagView.padding)
            .roundedBorder(
                cornerRadius: TagView.cornerRadius,
                style: .secondary,
                lineWidth: TagView.lineWidth
            )
    }
}

#Preview {
    TagView(title: "cute")
}
