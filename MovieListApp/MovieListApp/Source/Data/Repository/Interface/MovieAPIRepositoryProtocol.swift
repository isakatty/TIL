//
//  MovieAPIRepositoryProtocol.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/8/24.
//

import Foundation

protocol MovieAPIRepositoryProtocol {
    
    var service: NetworkManager { get }
    
    func fetchMovie() async throws -> [BoxOfficeModel]?
}
