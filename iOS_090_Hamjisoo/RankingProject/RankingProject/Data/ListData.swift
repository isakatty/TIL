//
//  ListData.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

import Foundation


struct ElementAnimation: Identifiable, Comparable {
    // 이 기준에 의해서 Rank 값을 이용하여 정렬이 되게 Comparable 프로토콜을 채택.
    static func < (lhs: ElementAnimation, rhs: ElementAnimation) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    static func > (lhs: ElementAnimation, rhs: ElementAnimation) -> Bool {
        return lhs.name < rhs.name
    }
    
    
    var id: UUID = UUID()
    var name: String
    var image: String
    var rank: Int
}


