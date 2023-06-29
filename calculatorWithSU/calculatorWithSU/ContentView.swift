//
//  ContentView.swift
//  calculatorWithSU
//
//  Created by Ham Seonwoo on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            Text("   환율 계산기   ")
                .font(.title)
                .foregroundColor(.white)
                .background(Color.pink)
                .cornerRadius(13)
                .frame(height:160)
            
            changeMoneyButton()
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
