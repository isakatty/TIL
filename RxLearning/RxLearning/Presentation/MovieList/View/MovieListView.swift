//
//  MovieListView.swift
//  RxLearning
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class MovieListView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension MovieListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        let movieVM = viewModel.memberViewModelAtIndex(indexPath.row)
//        cell.viewModel = movieVM
        
        cell.selectionStyle = .none
        return cell
    }
}
