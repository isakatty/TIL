//
//  ContentView.swift
//  memoWithStore
//
//  Created by Ham Seonwoo on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var memoTitle: String = ""
    @State var memoText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(memoStore.memoArray){ memo in
                        VStack(alignment: .leading){
                            Text(memo.title)
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text(memo.text)
                                .fontWeight(.light)
                        }
                    }
                    .onDelete{ indexSet in
                        memoStore.removeMemo(at: indexSet)
                    }
                }
                HStack{
                    VStack{
                        TextField("제목 작성", text: $memoTitle).padding(.bottom, 10)
                        
                        Divider()
                        
                        TextField("내용 작성", text: $memoText)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Button("ADD"){
                        memoStore.addMemo(title: memoTitle, text: memoText)
                        memoTitle = ""
                        memoText = ""
                    }
                }
                .padding()
            }
            .navigationTitle("memozzang")
            .refreshable {
                memoStore.fetchMemo()
            }
            .onAppear {
                memoStore.fetchMemo()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
