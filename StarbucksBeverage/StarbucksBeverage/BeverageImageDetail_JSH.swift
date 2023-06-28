//
//  BeverageImageDetail_JSH.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/27.
//

import SwiftUI

struct BeverageImageDetail_JSH: View {
    var coffee: StarbucksData
    
    var body: some View {
        VStack{
            Link(destination: URL(string: "\(coffee.detailLink)")!) {
                AsyncImage(url: URL(string: "\(coffee.imageName)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 350)
            }
            Text("☕️ \(coffee.name)")
                .font(.title3)
                .bold()
                .padding()
            Text(" ₩ \(coffee.price)원")
        }
    }
}

struct BeverageImageDetail_JSH_Previews: PreviewProvider {
    static var previews: some View {
        BeverageImageDetail_JSH(coffee: coffeeBeverage[0])
    }
}
