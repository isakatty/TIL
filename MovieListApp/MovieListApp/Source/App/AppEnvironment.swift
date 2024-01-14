//
//  AppEnvironment.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/8/24.
//

import Foundation

final class AppEnvironment {
    
    lazy var movieAPIService = NetworkManager(session: .shared)
    lazy var movieRemoteRepository: MovieAPIRepositoryProtocol = MovieAPIRepository(service: movieAPIService)
    
}
