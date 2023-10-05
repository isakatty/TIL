//
//  consumableIAPApp.swift
//  consumableIAP
//
//  Created by Jisoo HAM on 10/3/23.
//

import SwiftUI

@main
struct consumableIAPApp: App {
    @StateObject var store: Store = Store()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
