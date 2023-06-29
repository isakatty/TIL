//
//  ButtonView.swift
//  calculatorWithSU
//
//  Created by Ham Seonwoo on 2023/06/29.
//

import SwiftUI

struct ButtonView: View {
    
    let buttonString: String
    let backgroundColor: Color
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(buttonString)")
            Spacer()
        }
        .padding()
        .padding()
        .foregroundColor(.white)
        .background(backgroundColor)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonString: "loveya", backgroundColor: Color.green)
    }
}
