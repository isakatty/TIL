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
}

