//
//  BeverageDetail_JSH.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/27.
//

import SwiftUI

struct BeverageDetail_JSH: View {
    var coffee: StarbucksData
    
    var body: some View {
        NavigationStack{
            VStack{
                List(coffeeBeverage) { drink in
                    NavigationLink {
                        BeverageImageDetail_JSH(coffee: drink)
                    } label: {
                        Text("\(drink.name)")
                    }
                    .listStyle(.plain)
                    // title이 있고 -> 바 타이틀 디스플레이 모드를 통해서 그 타이틀의 위치를 바꾸겠다 !
//                    .navigationTitle("예?")
//                    .navigationBarTitleDisplayMode(.inline)
//                    .navigationBarItems(trailing: Button(action: {
//
//                    }, label: {
//                        Text("오른쪽이지롱")
//                    })
//                    )
                }
                
            }
            AsyncImage(url: URL(string: "https://t1.daumcdn.net/cfile/tistory/9951424F5E738F4330"), scale: 2.0)
        }
    }
}

struct BeverageDetail_JSH_Previews: PreviewProvider {
    static var previews: some View {
        BeverageDetail_JSH(coffee: coffeeBeverage[0])
    }
}
