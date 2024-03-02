//
//  ViewController.swift
//  searchEngine
//
//  Created by Jisoo HAM on 3/2/24.
//

import UIKit

public final class ViewController: UIViewController {
    
    private let viewModel: ViewModel
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    private let searchTVCell = SearchTableViewCell()
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
        configureUI()
    }
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: searchTVCell.identifier)
        
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchController.searchBar)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            searchController.searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchController.searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchController.searchBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            tableView.topAnchor.constraint(equalTo: searchController.searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

}

extension ViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return inSearchMode ? filteredUsers.count : users.count
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchTVCell.identifier, for: indexPath) as! SearchTableViewCell
//        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
//        cell.viewModel = UserCellViewModel(user: user)
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    // 다른 유저 Cell을 터치하면 해당 사용자의 프로필 화면으로 이동시키기
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
//        let controller = ProfileController(user: user)
//        navigationController?.pushViewController(controller, animated: true)
    }
}
extension ViewController: UISearchResultsUpdating {
    
    // 사용자가 검색창에 텍스트를 입력하면 실행되는 함수 (사용자가 검색하고자 하는 이름을 받아온다)
    public func updateSearchResults(for searchController: UISearchController) {
//        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        
        // 입력 텍스트가 users 명단에 있는지 확인, 존재한다면 filteredUsers에 추가
//        filteredUsers = users.filter({ $0.username.lowercased().contains(searchText) || $0.fullname.lowercased().contains(searchText) })
        
//        self.tableView.reloadData()
    }
    
}

