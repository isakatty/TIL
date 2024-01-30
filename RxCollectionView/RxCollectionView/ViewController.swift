//
//  ViewController.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/28/24.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = ViewModel()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: configureCollectionViewLayout()
        )
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ListCell.self,
                    forCellWithReuseIdentifier: ListCell.identifier)
        cv.register(HeaderView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: HeaderView.identifier)
        return cv
    }()
    
    let dataSource = RxCollectionViewSectionedReloadDataSource<DataSection> { dataSource, collectionView, indexPath, item in
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ListCell.identifier,
            for: indexPath
        ) as? ListCell else { return UICollectionViewCell() }
        
        cell.bind(with: item)
        
        return cell
    } configureSupplementaryView: { dataSource, collectionView, title, indexPath in
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderView.identifier,
            for: indexPath
        ) as? HeaderView else { return UICollectionReusableView() }
        
        let title = dataSource.sectionModels[indexPath.section].header
        header.configureHeader(with: title)
        
        return header
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bind()
        
    }
    
    private func configureUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func bind() {
        Observable.just(viewModel.sections)
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}

extension ViewController {
    private func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.1)
            )
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitems: [item]
            )
            
            // Header size
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(30.0)
            )
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        return layout
    }
}

