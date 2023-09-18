//
//  ViewExtension.swift
//  Meotstagram
//
//  Created by Jisoo HAM on 2023/09/18.
//

import SwiftUI

extension View {
    func borderedCaption(condition: Binding<Bool>) -> some View {
        modifier(BorderCaption(condition: condition))
    }
    
    func deliveryTextStyleModifier(isSelected: Bool) -> some View {
        modifier(DeliveryTextStyleModifier(isSelected: isSelected))
    }
    
    func deliveryButtonBackgroundModifier() -> some View {
        modifier(DeliveryButtonBackgroundModifier())
    }
}
