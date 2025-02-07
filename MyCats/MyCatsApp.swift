//
//  MyCatsApp.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

@main
struct MyCatsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didReceiveMemoryWarningNotification, object: nil)) { notification in
                    CATAASCaching.cleanCachedImages()
                }
        }
    }
}
