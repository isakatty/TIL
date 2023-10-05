//
//  ContentView.swift
//  consumableIAP
//
//  Created by Jisoo HAM on 10/3/23.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @EnvironmentObject var store: Store
    @AppStorage(Persistence.consumablesCountKey) var consumableCount: Int = 0
    @AppStorage(Persistence.consumablesCountKey1) var consumableCount1: Int = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("You have")) {
                    HStack {
                        Spacer()
                        ProductView(
                            icon: "🔎",
                            quantity: "\(consumableCount)"
                        )
                        Spacer()
                        ProductView(
                            icon: "📢",
                            quantity: "\(consumableCount1)"
                        )
                        Spacer()
                    }
                }
                
                Section(header: Text("To buy")) {
                    ForEach(store.products) { product in
                        HStack {
                            Text(product.displayName)
                            Spacer()
                            Button("\(product.displayPrice)") {
                                Task {
                                    try await store.purchase(product)
                                }
                            }
                        }
                    }
                }
                
                Button("Restore purchases") {
                    Task {
                        try await AppStore.sync()
                    }
                }
                NavigationLink("Support", destination: SupportView())
                
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Store())
}
