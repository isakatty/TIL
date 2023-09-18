//
//  ContentView.swift
//  Meotstagram
//
//  Created by Jisoo HAM on 2023/09/15.
//

import SwiftUI

extension View {
    func borderedCaption(condition: Binding<Bool>) -> some View {
        modifier(BorderCaption(condition: condition))
    }
    
    func deliveryTextStyleModifier(isSelected: Binding<Bool>) -> some View {
        modifier(DeliveryTextStyleModifier(isSelected: isSelected))
    }
    
    func deliveryButtonBackgroundModifier() -> some View {
        modifier(DeliveryButtonBackgroundModifier())
    }
}

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
                    .deliveryButtonBackgroundModifier()
                    .deliveryTextStyleModifier(isSelected: Binding(
                        get: { return deliverOpt == deliver },
                        set: { newValue in
                            if newValue {
                                deliverOpt = deliver
                            }
                        }
                    ))
//                    .deliveryTextStyleModifier(isSelected: Binding(get: {
//                        return deliverOpt == deliver
//                    }, set: { _ in
//                        deliverOpt = deliver
//                    }))
                    /*
                     47번째 라인에서 선택된 버튼의 값을 deliverOpt에 할당.
                     77번째 라인에서 deliverOpt과 deliver가 같다면 true를 반환. (get - 읽기 기능)
                     78번째 라인에서 deliver을 deliverOpt에 할당. (set - 쓰기 기능)
                     
                     */
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
