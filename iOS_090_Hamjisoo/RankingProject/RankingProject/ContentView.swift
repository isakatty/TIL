//
//  ContentView.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

/*
 <추가로 적용할 사항>
 
 - 지금 정렬이 rank에 의한 정렬뿐. 정렬 종류를 골라서 사용할 수 있다면 ?!
    picker를 어떻게 사용하면 되지 않을까 ?
 - DetailView에서 자세하게 보여줄 수 있다면 ?! - 완
 - 버튼의 온오프 기능이 생겼으면 좋겠어요 ! - 완
 */


import SwiftUI

struct ContentView: View {
    @State var tabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $tabIndex) {
            NavigationStack{
                SelectedListView(elementStore: ElementalStore())
            }
            .tabItem {
                Image(systemName: "checkmark.square.fill")
                Text("Choose")
            }.tag(1)
            AboutCharacterListView(elementStore: ElementalStore())
            .tabItem {
                Image(systemName: "person")
                Text("About")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
