//
//  ViewModel.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/28/24.
//

import Foundation

final class ViewModel {
//    var sections = [
//        DataSection(header: "첫번째 헤더", items: [CellData(title: "4432"), CellData(title: "452")]),
//        DataSection(header: "두번째 헤더", items: [CellData(title: "오늘 아침은"), CellData(title: "카레")]),
//        DataSection(header: "세번째 헤더", items: [CellData(title: "RxcollectionView"), CellData(title: "성공하기")]),
//    ]
    
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
}
