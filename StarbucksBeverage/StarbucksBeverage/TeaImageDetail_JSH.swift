//
//  TeaImageDetail_JSH.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/28.
//

import SwiftUI

struct TeaImageDetail_JSH: View {
    var tea: StarbucksData
    
    var body: some View {
        VStack{
            Link(destination: URL(string: "\(tea.detailLink)")!) {
                AsyncImage(url: URL(string: "\(tea.imageName)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 350)
            }
            Text("☕️ \(tea.name)")
                .font(.title3)
                .bold()
                .padding()
            Text(" ₩ \(tea.price)원")
        }
    }
}

struct TeaImageDetail_JSH_Previews: PreviewProvider {
    static var previews: some View {
        TeaImageDetail_JSH(tea: teaBeverage[4])
    }
}
