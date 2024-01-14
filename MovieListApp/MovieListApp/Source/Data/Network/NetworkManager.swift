//
//  NetworkManager.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/5/24.
//

import Foundation

final class NetworkManager {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func requestGETAPI(with url: URL) async throws -> Data {
        let (data, response) = try await session.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              (200...299) ~= statusCode
        else {
            throw NetworkError.networking
        }
        
        return data
    }
}
