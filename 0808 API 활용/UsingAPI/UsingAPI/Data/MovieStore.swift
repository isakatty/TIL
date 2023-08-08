//
//  MovieStore.swift
//  UsingAPI
//
//  Created by Ham Seonwoo on 2023/08/08.
//

import Foundation

class MovieStore: ObservableObject{
    
    @Published var movies: [Movie] = []
    @Published var mvCharts: [MvChart] = []
    
    
    func fetchData() async {
        guard let url = URL(string: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(PrivateKey().keys)&targetDt=20230807") else {
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("\(response)")
            
            let jsonString = String(data: data, encoding: .utf8)
            print("\(jsonString ?? "")")
            
            let res = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
            DispatchQueue.main.async { [self] in
                self.movies = res.boxOfficeResult.dailyBoxOfficeList.map { data in
                    Movie(rank: data.rank, movieNm: data.movieNm)
                }
                
                self.mvCharts = res.boxOfficeResult.dailyBoxOfficeList.map { data in
                    MvChart(movieNm: data.movieNm, salesAmt: data.salesAmt)
                }
                
            }
        } catch {
            debugPrint("--------")
            debugPrint("Error loading \(url):")
            debugPrint("\(String(describing: error))")
            debugPrint("--------")
            
        }
    }
}
