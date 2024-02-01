//
//  ScrollViewController.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/30/24.
//

import UIKit

import RxSwift
import RxCocoa

import RxDataSources

//class ScrollViewController: UIViewController {
//    
//    let scrollView : UIScrollView = UIScrollView()
//    let studying: BusStopInfoHeaderView = BusStopInfoHeaderView()
//    var collectionView = BusStopCollectionView()
//    let viewModel = ViewModel()
//    let disposeBag = DisposeBag()
//    
//    let BusStopView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .systemBackground
//        
//        configureUI()
//        bind()
//    }
//    
//    func bind() {
//        Observable.just(viewModel.sections)
//            .bind(to: collectionView.collectionView.rx.items(dataSource: collectionView.dataSource))
//            .disposed(by: disposeBag)
//    }
//
//}
//
//
//extension ScrollViewController {
//    func configureUI() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(BusStopView)
//        
//        [scrollView, studying, collectionView, BusStopView]
//            .forEach { components in
//                components.translatesAutoresizingMaskIntoConstraints = false
//            }
//    
//        [studying, collectionView]
//            .forEach { components in
//                BusStopView.addSubview(components)
//            }
//        
//        collectionView.collectionView.isScrollEnabled = false
//        
//        NSLayoutConstraint.activate([
//            // scrollview의 content guide 설정이 안됨!
//            // lead, trail을 content guide에 맞춰주어야 scrollview 잡힘.
//            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            //61, 62는 좌우 스크롤을 막기 위함. contentLayoutGuide
//            
//            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            
//            BusStopView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            BusStopView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            BusStopView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
//            BusStopView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
//            studying.topAnchor.constraint(equalTo: BusStopView.topAnchor),
//            studying.leadingAnchor.constraint(equalTo: BusStopView.leadingAnchor),
//            studying.trailingAnchor.constraint(equalTo: BusStopView.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: studying.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: BusStopView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: BusStopView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: BusStopView.bottomAnchor)
//            
//            
//        ])
//    }
//}

