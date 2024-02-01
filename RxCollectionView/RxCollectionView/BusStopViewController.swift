//
//  BusStopViewController.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/30/24.
//

import UIKit

import RxSwift
import RxCocoa

import RxDataSources

class BusStopViewController: UIViewController {
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    private let headerView: BusStopInfoHeaderView = BusStopInfoHeaderView()
    private var scrollView: UIScrollView = UIScrollView()
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(TableCell.self,
                    forCellReuseIdentifier: TableCell.identifier)
        
        tv.register(HeaderView.self,
                    forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tv.isScrollEnabled = false
        return tv
    }()
    private let contentView = UIView()
    
    var tableViewHeightConstraint = NSLayoutConstraint()
    let dataSource = RxTableViewSectionedReloadDataSource<DataSection> { dataSource, tableView, indexPath, item in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as? TableCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.bind(with: item)
        
        return cell
    } 
//titleForHeaderInSection: { dataSource, indexPath in
//        return dataSource.sectionModels[indexPath].header
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        bind()
        
    }
    
    func bind() {
        Observable.just(viewModel.sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    func configureUI() {
        view.addSubview(scrollView)
        
        [scrollView, contentView, headerView, tableView]
            .forEach { components in
                components.translatesAutoresizingMaskIntoConstraints = false
            }
        
        
        [headerView, tableView]
            .forEach { components in
                contentView.addSubview(components)
            }
        
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableViewHeightConstraint,
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewHeightConstraint.constant = tableView.contentSize.height
    }
}

extension BusStopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView
        else { return UIView() }
        
        headerView.configureHeader(with: dataSource.sectionModels[section].header)
        
        return headerView
    }
    
}
