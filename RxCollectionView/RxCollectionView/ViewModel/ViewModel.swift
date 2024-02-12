//
//  ViewModel.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/28/24.
//

import Foundation

import RxSwift

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


final class ViewModel {
    
    private let disposeBag = DisposeBag()
    // 코디네이션 필요함 -> 지도 뷰 이동
    var useCase: DefaultBusStopUseCase
    
    public init(useCase: DefaultBusStopUseCase) {
        self.useCase = useCase
    }
    
    public func transform(input: Input) -> Output {
        let output = Output(
            busStopSections: .init()
        )
        
        input.viewWillAppearEvent
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.useCase.bindBusStopList()
                }
            )
            .disposed(by: disposeBag)
        
        input.busStopMapBtnTapEvent
            .subscribe { num in
                // 화면 전환 -> Coordinator를 이용해서 뷰 이동
            }
            .disposed(by: disposeBag)
        
        useCase.busStopSections
            .bind(
                to: output.busStopSections
            )
            .disposed(by: disposeBag)
        
        return output
    }
    
}

extension ViewModel {
    public struct Input {
        let viewWillAppearEvent: Observable<Void>
        let likeBusStopBtnTapEvent: Observable<Int>
        let likeBusBtnTapEvent: Observable<IndexPath>
        let alarmBtnTapEvent: Observable<IndexPath>
        let busStopMapBtnTapEvent: Observable<Int>
    }
    
    public struct Output {
        var busStopSections: PublishSubject<[DataSection]>
        // header data
        //        var busStopInfoResponse: PublishSubject<>
    }
}

