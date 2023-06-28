//
//  ContentView.swift
//  StarbucksBeverage
//
//  Created by Ham Seonwoo on 2023/06/27.
//

import SwiftUI


struct ContentView: View {
    
    let food: [String] = ["coffee","tea & beverage","snack"]
    
    var body: some View {
        NavigationStack{
            List(food, id: \.self) { foods in
                NavigationLink {
                    
                    switch foods {
                    case "coffee" :
                        BeverageDetail_JSH(coffee: coffeeBeverage[0])
                    case "tea & beverage":
                        TeaDetail_JSH(tea: teaBeverage[0])
                    case "snack" :
                        SnackDetail_JSH(snack: sandwich[0])
                    default:
                        BeverageDetail_JSH(coffee: coffeeBeverage[0])
                    }
                } label: {
                    Text("\(foods)")
                        .font(.title3)
                }
                //네비게이션 바를 통해 왼 오 화면 넘김 + 중앙 타이틀 (?)
                .listStyle(.plain) //
                .navigationTitle("STARBUCKS TOP TIER")
            }
            
            AsyncImage(url: URL(string: "https://t1.daumcdn.net/cfile/tistory/9951424F5E738F4330"), scale: 2.0)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
