//
//  MemoStore.swift
//  memoWithStore
//
//  Created by Ham Seonwoo on 2023/08/16.
//

import Foundation
import FirebaseFirestore

class MemoStore: ObservableObject{
    @Published var memoArray: [Memo] = []
    
    init(){
        
    }
    
//    @MainActor // 이것만 써줘도 보라색 워닝 엉.. 없어짐
    
    func fetchMemo(){
        // collection에 Memo라고 하는 애를 가져오는데, 그 내부에 있는 documents에는 실제 데이터와 에러가 존재함
        // 그 두 데이터 중에서 실제 데이터가 존재한다면 그걸 분해해서 새 배열에 담고
        // 새 배열에 담은 것들을 관찰을 하기 위해 만들었던 배열에 담아줘.
        
        // ⭐️이미 firestore에 async-await가 내장되어있기 때문에 뷰를 다시 그리는 것이 동일하게 메인에서 같이 돌아갈 것.
        Firestore.firestore().collection("Memo").getDocuments{ (snapshot, error) in
            if let snapshot {
                var savedMemoArray: [Memo] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    // document.data()는 key-value 쌍으로 되어있는 데이터
                    let docData = document.data()
                    let title: String = docData["title"] as? String ?? ""
                    let text: String = docData["text"] as? String ?? ""
                    let createdAt: Double = docData["createdAt"] as? Double ?? 0
                    
                    let memo: Memo = Memo(id: id, title: title, text: text, createdAt: createdAt)
                    savedMemoArray.append(memo)
                }
                
                self.memoArray = savedMemoArray
                // 후행 클로저로 만들어있기 때문에 다른 스레드에서 작용하게 되니까 어느 스레드에서 사용될지 알려주기 위해 self를 붙인다 ?
                self.sortMemoArray()
            }
        }
    }
    
    //데이터 추가
    func addMemo(title: String, text: String){
        let memo: Memo = Memo(title: title, text: text)
        
        // "Memo"라는 콜랙션에 데이터를 추가할건데, uuid에 의해 겹치지 않을 id를 먼저 추가해주고
        // 이후 메모 내용(text, title) 추가
        // 배열에 추가해줌으로 배열과 DB에 올라간 데이터까지 연동
        Firestore.firestore().collection("Memo")
            .document(memo.id)
            .setData(["title": memo.title, "text": memo.text, "createdAt": memo.createdAt])
        
        memoArray.append(memo)
        sortMemoArray()
    }
    
    // 데이터 제거
    func removeMemo(at offsets: IndexSet){
        //offsets는 배열임.
        
        // 다중선택해서 지우는거 아니고 onDelete로 구현해서 지울거라 어차피 배열 요소 1개
        // 그 선택된 요소의 id값을 지워 -> 그럼 내부의 text, title 모두 지울 수 있지.
        for offset in offsets {
            let memo = memoArray[offset]
            
            Firestore.firestore().collection("Memo")
                .document(memo.id)
                .delete()
        }
        
        memoArray.remove(atOffsets: offsets)
        sortMemoArray()
    }
    
    func sortMemoArray() {
        // 조건이 맞으면 sorting 됨. 메모 두개를 꺼내서 계속 비교 할 것.
        memoArray = memoArray.sorted{ memo1, memo2 in
            memo1.createdAt < memo2.createdAt
        }
        // 클로저 문법에 의해 생략.
//        memoArray = memoArray.sorted{ $0, $1 in
//            $0.createdAt < $1.createdAt
//        }
    }
}
