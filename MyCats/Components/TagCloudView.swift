//
//  TagCloudView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct TagCloudView: View {
    
    let tags: [String]
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                TagView(title: tag)
            }
        }
    }
}

#Preview {
    TagCloudView(tags: [
        "two",
        "double",
        "black"
      ])
}
