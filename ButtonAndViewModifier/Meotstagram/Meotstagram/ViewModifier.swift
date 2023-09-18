//
//  dd.swift
//  Meotstagram
//
//  Created by Jisoo HAM on 2023/09/15.
//

import SwiftUI

struct BorderCaption: ViewModifier {
    @Binding var condition: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: condition ? .bold : .regular))
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(condition ? .blue : .black)
    }
}

struct DeliveryTextStyleModifier: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(isSelected ? .blue : .black)
            .font(.system(size: 18, weight: isSelected ? .bold : .regular))
    }
}

struct DeliveryButtonBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
            )
    }
}
