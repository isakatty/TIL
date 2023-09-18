//
//  ContentView.swift
//  Meotstagram
//
//  Created by Jisoo HAM on 2023/09/15.
//

import SwiftUI

enum deliveryChoice: String, CaseIterable {
    
    case onlyOne = "한집배달"
    case severalHome = "세이브배달"
    
    var fee : Int {
        switch self {
        case .onlyOne :
            return 3000
        case .severalHome :
            return 2000
        }
    }
}


struct ContentView: View {
    @State private var deliverOpt = deliveryChoice.onlyOne

    var body: some View {
        VStack {
            ForEach(deliveryChoice.allCases, id: \.self) { deliver in
                Button {
                    deliverOpt = deliver
                } label: {
                    VStack(alignment: .leading ) {
                        HStack {
                            Image(systemName: deliverOpt == deliver ? "o.circle.fill" : "o.circle")
                            VStack(alignment: .leading) {
                                Text(deliver.rawValue)
                            }
                            Spacer()
                            switch deliver {
                            case .onlyOne :
                                Text("배달비 : \(deliver.fee)원")
                            case .severalHome :
                                VStack {
                                    ZStack {
                                        Text("배달비 : \(deliveryChoice.onlyOne.fee)원")
                                        Rectangle()
                                            .frame(width: 73, height: 2)
                                            .foregroundColor(.red)
                                            .padding(.leading, 60)
                                    }
                                    Text("\(deliver.fee)원")
                                        .padding(.leading, 60)
                                }
                            }
                        }
                    }
                    .frame(height: 40)
                    .modifier(DeliveryButtonBackgroundModifier())
                    .modifier(DeliveryTextStyleModifier(isSelected: deliverOpt == deliver))
//                    .deliveryButtonBackgroundModifier()
//                    .deliveryTextStyleModifier(isSelected: deliverOpt == deliver)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
