//
//  ProductView.swift
//  consumableIAP
//
//  Created by Jisoo HAM on 10/3/23.
//

import SwiftUI

struct ProductView: View {
    var icon: String
    var quantity: String
    
    var body: some View {
        VStack {
            Text(icon)
            Text(quantity)
        }
        .padding()
    }
}

#Preview {
    ProductView(icon: "🔎", quantity: "1")
}
