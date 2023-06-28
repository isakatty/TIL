//
//  SnackImgaeDetail_JSH.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/27.
//

import SwiftUI

struct SnackImgaeDetail_JSH: View {
    //구조체
    var snack: StarbucksData
    
    var body: some View {
        VStack{
            Link(destination: URL(string: "\(snack.detailLink)")!) {
                AsyncImage(url: URL(string: "\(snack.imageName)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 350)
            }
            Text("🥪 \(snack.name)")
                .font(.title3)
                .bold()
                .padding()
            Text(" ₩ \(snack.price)원")
        }
    }
}

struct SnackImgaeDetail_JSH_Previews: PreviewProvider {
    static var previews: some View {
        SnackImgaeDetail_JSH(snack: sandwich[0])
    }
}
