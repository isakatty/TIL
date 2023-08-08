//
//  ContentView.swift
//  UsingAPI
//
//  Created by Ham Seonwoo on 2023/08/08.
//


// 영화진흥위원회 API를 가져와서 활용해보자 !!
// 내 key: 35121b06049e02db77ffb404b2203fa6
/*
 http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=35121b06049e02db77ffb404b2203fa6&targetDt=20230807
 */
//


import SwiftUI
import Charts


struct MovieChartView: View {
    @ObservedObject var movieStore: MovieStore = MovieStore()
    
    
    var body: some View {
        
        NavigationStack{
            Chart(movieStore.mvCharts) { mv in
                LineMark(
                    x: .value("영화 이름", mv.movieNm),
                    y: .value("관객수", mv.salesAmntInt)
                )
            }
            .onAppear {
                Task {
                    await movieStore.fetchData()
                }
            }
            .navigationTitle("차트")
        }
        
    }
    
}


struct MovieChartView_Previews: PreviewProvider {
    static var previews: some View {
        MovieChartView()
    }
}
