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
        // collection에 memo라고 하는 애를 가져오는 것.
        Firestore.firestore().collection("Memo").getDocuments{ (snapshot, error) in
            if let snapshot {
                var savedMemoArray: [Memo] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData = document.data()
                    let title: String = docData["title"] as? String ?? ""
                    let text: String = docData["text"] as? String ?? ""
                    
                    let memo: Memo = Memo(id: id, title: title, text: text)
                    savedMemoArray.append(memo)
                }
                
                DispatchQueue.main.async {
                    self.memoArray = savedMemoArray
                }
            }
        }
    }
    
    func addMemo(title: String, text: String){
        let memo: Memo = Memo(title: title, text: text)
        
        Firestore.firestore().collection("Memo")
            .document(memo.id)
            .setData(["title": memo.title, "text": memo.text])
        
        memoArray.append(memo)
        
//        Task {
//            do {
//                try await Firestore.firestore().collection("Memo")
//                    .document(memo.id)
//                    .setData(["title": memo.title, "text": memo.text])
//
//                // 왜 self? -> background에서 돌아가고 있던 것을 main으로 끌고와서 실행시키기 위해 디스패치큐를 써주고 있지
//                DispatchQueue.main.async {
//                    self.memoArray.append(memo)
//                }
//            } catch {
//                print("firestore error")
//            }
//        }
    }
    
    func removeMemo(at offsets: IndexSet){
        for offset in offsets {
            let memo = memoArray[offset]
            
            Firestore.firestore().collection("Memo")
                .document(memo.id)
                .delete()
        }
        
        memoArray.remove(atOffsets: offsets)
        
        
//        for offset in offsets {
//            let memo = memoArray[offset]
//
//            Task {
//                do {
//                    try await Firestore.firestore().collection("Memo").document(memo.id).delete()
//                } catch {
//                    print("Firestore remove error")
//                }
//            }
//
//            memoArray.remove(at: offset)
//        }
    }
}
