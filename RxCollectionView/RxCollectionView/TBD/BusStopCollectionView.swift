//
//  BusStopCollectionView.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/30/24.
//

import UIKit

import RxDataSources

//class BusStopCollectionView: UIView {
//
//    lazy var collectionView: UICollectionView = {
//        let cv = UICollectionView(frame: .zero,
//                                  collectionViewLayout: configureCollectionViewLayout()
//        )
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(ListCell.self,
//                    forCellWithReuseIdentifier: ListCell.identifier)
//        return cv
//    }()
//    
//    let dataSource = RxCollectionViewSectionedReloadDataSource<DataSection> { dataSource, tableView, indexPath, item in
//        guard let cell = tableView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell
//        else { return UITableViewCell() }
//        cell.bind(with: item)
//        
//        return cell
//    } configureSupplementaryView: { dataSource, collectionView, title, indexPath in
//        guard let header = collectionView.dequeueReusableSupplementaryView(
//            ofKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: HeaderView.identifier,
//            for: indexPath
//        ) as? HeaderView else { return UICollectionReusableView() }
//        
//        let title = dataSource.sectionModels[indexPath.section].header
//        header.configureHeader(with: title)
//        
//        return header
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        configureUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configureUI() {
//        addSubview(collectionView)
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: super.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: super.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: super.bottomAnchor)
//        ])
//    }
//    
//}
//
//extension BusStopCollectionView {
//    private func configureCollectionViewLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { _, _ in
//            let itemSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(1.0)
//            )
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            
//            let groupSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(0.05)
//            )
//            let group = NSCollectionLayoutGroup.vertical(
//                layoutSize: groupSize,
//                subitems: [item]
//            )
//            
//            // Header size
//            let headerSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .absolute(30.0)
//            )
//            
//            let header = NSCollectionLayoutBoundarySupplementaryItem(
//                layoutSize: headerSize,
//                elementKind: UICollectionView.elementKindSectionHeader,
//                alignment: .top
//            )
//            
//            let section = NSCollectionLayoutSection(group: group)
//            section.boundarySupplementaryItems = [header]
//            
//            return section
//        }
//        return layout
//    }
//}
