//
//  TabView.swift
//  UsingAPI
//
//  Created by Ham Seonwoo on 2023/08/08.
//

import SwiftUI

struct TabsView: View {
    @State private var tabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $tabIndex) {
            
            MovieListView()
                .tabItem {
                    Image(systemName: "popcorn")
                    Text("영화")
                }
                .tag(1)
            
            MovieChartView()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                    Text("영화 차트")
                }
                .tag(2)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
