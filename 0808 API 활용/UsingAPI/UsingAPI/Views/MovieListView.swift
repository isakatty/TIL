//
//  MovieListView.swift
//  UsingAPI
//
//  Created by Ham Seonwoo on 2023/08/08.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieStore: MovieStore = MovieStore()
    
    var body: some View {
        NavigationStack{
            List(movieStore.movies) { movie in
                HStack{
                    Text("\(movie.rank) 등")
                    
                    Spacer()
                    
                    Text(movie.movieNm)
                }
            }
            .onAppear {
                Task {
                    await movieStore.fetchData()
                }
            }
            .navigationTitle("0807 일별 Box office")
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
