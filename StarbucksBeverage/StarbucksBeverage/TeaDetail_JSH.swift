//
//  TeaDetail_JSH.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/28.
//

import SwiftUI

struct TeaDetail_JSH: View {
    var tea: StarbucksData
    
    var body: some View {
        NavigationStack{
            List(teaBeverage) { ttea in
                NavigationLink {
                    TeaImageDetail_JSH(tea: ttea)
                } label: {
                    Text("\(ttea.name)")
                }
                .listStyle(.plain)
                .navigationTitle("Tea & Beverage")
                
            }
            
        }
    }
}

struct TeaDetail_JSH_Previews: PreviewProvider {
    static var previews: some View {
        TeaDetail_JSH(tea: teaBeverage[0])
    }
}
