//
//  BusStopUseCase.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 2/5/24.
//

import Foundation

import RxSwift

protocol BusStopUseCase {
    var busStopSections: PublishSubject<[DataSection]> { get }
}
