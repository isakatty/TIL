//
//  MovieListViewController.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class MovieListViewController: UIViewController {

    let tableView = UITableView()
    let environment: AppEnvironment = AppEnvironment()
    
    weak var coordinator: MovieListMainCoordinator?
    private let movieListViewModel: DailyBoxOfficeListViewModel
    
    init(coordinator: MovieListMainCoordinator? = nil, movieListViewModel: DailyBoxOfficeListViewModel) {
        self.movieListViewModel = movieListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieListViewModel.fetchMovies(completion: {
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        })
        
        setupTableView()
        setupTableViewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieListViewModel.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movieVM = movieListViewModel.movieViewModelAtIndex(indexPath)
        cell.viewModel = movieVM
        
        cell.selectionStyle = .none
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("1")
//        movieListViewModel.handleNextVC(indexPath.row, fromCurrentVC: self, animated: true)
        coordinator?.showMovieDetail(movieModel: BoxOfficeModel(movieName: movieListViewModel.movieViewModelAtIndex(indexPath)?.movieNm ?? "없어유",
                                                                movieCode: movieListViewModel.movieViewModelAtIndex(indexPath)?.movieCd ?? "없어유",
                                                                openDate: movieListViewModel.movieViewModelAtIndex(indexPath)?.openDt ?? "없어유",
                                                                audiAcc: movieListViewModel.movieViewModelAtIndex(indexPath)?.audiAc ?? "없어유"))
        print("2")
    }
}
