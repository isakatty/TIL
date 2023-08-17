//
//  Memo.swift
//  memoWithStore
//
//  Created by Ham Seonwoo on 2023/08/16.
//

import Foundation

struct Memo: Identifiable{
    var id : String = UUID().uuidString
    
    var title: String
    var text: String
    // 날짜 정보를 어느 시간을 기준으로 계산하여 활용 가능
    var createdAt: Double = Date().timeIntervalSince1970
    
    // localization을 파고들면 자동으로 가능 하지만 수동으로 만드는 방법 사용할 것
    var createdData:String {
        // Date(timeIntervalSince1970: createdAt) 이 형식은 timeInterval!!
        // timeInterval은 typealias로 double 타입이라 우리가 위에서 설정 자체를 double로 주었음
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        
        let dateFormatter = DateFormatter()
        // 한국, 한국어로 보여줄게
        dateFormatter.locale = Locale(identifier: "ko_kr")
        // 한국 표준시를 기준으로
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년MM월DD일 HH시mm분ss초"
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}

