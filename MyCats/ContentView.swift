//
//  ContentView.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            CatsListViewFactory.build()
        }
    }
}

#Preview {
    ContentView()
}
