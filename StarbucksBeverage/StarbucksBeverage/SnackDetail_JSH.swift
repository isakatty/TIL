//
//  SnackDetail_JSH.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/27.
//

import SwiftUI

struct SnackDetail_JSH: View {
    var snack: StarbucksData
    
    var body: some View {
        NavigationStack{
            List(sandwich) { ssnack in
                NavigationLink {
                    SnackImgaeDetail_JSH(snack: ssnack)
                } label: {
                    Text("\(ssnack.name)")
                }
                .listStyle(.plain)
                .navigationTitle("Sandwich & Salad")
                
            }
            
        }
    }
}

struct SnackDetail_JSH_Previews: PreviewProvider {
    static var previews: some View {
        SnackDetail_JSH(snack: sandwich[0])
    }
}
