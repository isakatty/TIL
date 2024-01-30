//
//  Model.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/28/24.
//

import Foundation
import RxDataSources

struct CellInfo {
    let busNm: String
    let nextSt: String
    var arrMsgMin1: String
    var arrMsgSt1: String
    var arrMsgMin2: String
    var arrMsgSt2: String
}

struct CellData {
    let title: String
}

struct DataSection {
    var header: String
    var items: [Item]
}

extension DataSection: SectionModelType {
    typealias Item = CellInfo
    
    init(original: DataSection, items: [CellInfo]) {
        self = original
        self.items = items
    }
}



