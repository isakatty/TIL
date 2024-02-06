//
//  DefaultBusStopUseCase.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 2/5/24.
//

import Foundation

import RxSwift
import RxCocoa

final class DefaultBusStopUseCase: BusStopUseCase {
    // 레포지토리 - 주입
    var busStopSections: PublishSubject<[DataSection]>
    let disposeBag = DisposeBag()
    
    // Mock data
    var sections = [
        DataSection(header: "간선버스", items: [
            CellInfo(busNm: "342", nextSt: "강남구보건소 방면", arrMsgMin1: "7분", arrMsgSt1: "3정거장 전", arrMsgMin2: "18분", arrMsgSt2: "9정거장 전"),
            CellInfo(busNm: "471", nextSt: "강남구보건소 방면", arrMsgMin1: "곧 도착", arrMsgSt1: "1정거장 전", arrMsgMin2: "18분", arrMsgSt2: "9정거장 전"),
        ]),
        DataSection(header: "지선버스", items: [
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
            CellInfo(busNm: "3412", nextSt: "수서역 방면", arrMsgMin1: "3분", arrMsgSt1: "2정거장 전", arrMsgMin2: "9분", arrMsgSt2: "4정거장 전"),
        ])
    ]
    
    init(busStopSections: PublishSubject<[DataSection]> = PublishSubject<[DataSection]>()) {
        self.busStopSections = busStopSections
        bindBusStopList()
    }
    
    func bindBusStopList() {
        busStopSections
            .onNext(sections)
    }
}

