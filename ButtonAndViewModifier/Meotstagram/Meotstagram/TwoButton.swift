//
//  TwoButton.swift
//  Meotstagram
//
//  Created by Jisoo HAM on 2023/09/18.
//

import SwiftUI

// 바인딩을 사용하여 true/false는 토글 스위치에서만 가능한 방법.

struct TwoButton: View {
    @State private var firstToggle = false
    @State private var secondToggle = false

    var body: some View {
        let firstBinding = Binding(
            get: { self.firstToggle },
            set: {
                self.firstToggle = $0

                if $0 == true {
                    self.secondToggle = false
                }
            }
        )

        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0

                if $0 == true {
                    self.firstToggle = false
                }
            }
        )

        return VStack {
            Toggle(isOn: firstBinding) {
                Text("First toggle")
            }
            Divider()
            Toggle(isOn: secondBinding) {
                Text("Second toggle")
            }
        }
        .deliveryButtonBackgroundModifier()
        
//        VStack {
//            Text("1번 선택")
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 3)
//                        .stroke(lineWidth: 1)
//                )
//                .foregroundColor(firstToggle ? .blue : .black)
//                .onTapGesture {
//                    firstBinding.wrappedValue.toggle()
//                }
//            Text("2번 선택")
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 3)
//                        .stroke(lineWidth: 1)
//                )
//                .foregroundColor(secondToggle ? .blue : .black)
//                .onTapGesture {
//                    secondBinding.wrappedValue.toggle()
//                }
//        }
    }
}

struct TwoButton_Previews: PreviewProvider {
    static var previews: some View {
        TwoButton()
    }
}
