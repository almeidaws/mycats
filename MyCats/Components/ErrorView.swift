//
//  ErrorView.swift
//  MyCats
//
//  Created by Alma Viva on 07/02/25.
//

import SwiftUI

struct ErrorView: View {
    
    let error: Error
    let action: () -> Void
    
    var body: some View {
        VStack {
        #if DEBUG
            Text(error.localizedDescription)
        #else
            Text("An error has occured. Please, try again")
        #endif
            Button(action: action, label: {
                Text("Try again")
            })
        }
    }
}

#Preview {
    ErrorView(error: URLError(URLError.Code(rawValue: 500))) {
        // DOES NOTHING
    }
}
