//
//  MovieAPIRepository.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/8/24.
//

import Foundation

final class MovieAPIRepository: MovieAPIRepositoryProtocol {
    
    let service: NetworkManager
    
    let baseURL: String = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    
    var value: String {
        guard let url = Bundle.main.url(forResource: "Info", withExtension: "plist"),
              let dictionary = NSDictionary(contentsOf: url) else { return  "" }
        
        return dictionary["KEY"] as? String ?? ""
    }
    
    init(service: NetworkManager) {
        self.service = service
        print("\(value)")
    }
    
    func fetchMovie() async throws-> [BoxOfficeModel]? {
        guard let url = URLComponents(string: baseURL+"key=\(value)"+"&targetDt=20240110")?.url else { throw NetworkError.invalidURL }
        let data = try await service.requestGETAPI(with: url)
        let movies = try parseJSON(data)
        print("🔴 데이터 파싱 \n \(String(describing: movies))")
        return movies
    }
    
    private func parseJSON(_ data: Data) throws -> [BoxOfficeModel]? {
        let decodedData = try JSONDecoder().decode(DailiyBoxOfficeDTO.self, from: data)
        
        return decodedData.boxOfficeResult.dailyBoxOfficeList.map { BoxOfficeListDTO in
            BoxOfficeListDTO.toDomain()
        }
    }
}
