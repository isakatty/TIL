//
//  SelectList.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

//⭐️버튼을 눌렀을때의 action이라서 .. swipe로 elements를 지웠을때 자동으로 버튼이 막혀야하는디...
// swipeAction에서 휴지통 버튼을 눌렀을때 alert 작동하여 진짜 지울건지 확인할 수 있으면 좋겠을까..?
// 아님 전체 삭제 버튼을 넣고 거기서 진짜 삭제할건지 물어보는게 좋을까 ?


import SwiftUI

struct SelectedListView: View {
    @ObservedObject var elementStore: ElementalStore
    @State var isChosen: Bool = false
    @State var isNewElements: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List(elementStore.newElements){ characs in
                    HStack{
                        AsyncImage(url: URL(string: "\(characs.image)")){ image in
                            image
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100,height: 100)
                        }placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                        Text(characs.name)
                            .bold()
                            .font(.title2)
                            .swipeActions {
                                Button {
                                    elementStore.removeCharac(characs)
                                } label: {
                                    Image(systemName: "trash.circle.fill")
                                }
                                
                            }.tint(.red)
                    }
                    
                    
                }
                
                Spacer()
                //정렬하기 버튼을 이용하여 캐릭터들의 정렬이 될 것. Rank를 비교하여 정렬을 할 예정임.
                Button {
                    //버튼을 눌렀을때의 action이라서 .. swipe로 elements를 지웠을때 자동으로 버튼이 막혀야하는디.
                    if elementStore.newElements.count > 0 {
                        elementStore.sortingChars()
                    } else {
                        isNewElements = false
                    }
                } label: {
                    Text(" 줄 세우기 ")
                }.disabled(!isNewElements)

            }
            .navigationTitle("선택된 캐릭터")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        elementStore.removeCharacAll()
                    } label: {
                        Text("전체 삭제")
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isChosen = true
                    } label: {
                        Text("추가")
                    }
                    
                }
            }
            .sheet(isPresented: $isChosen) {
                CharacterListView(elementStore: elementStore, isChosen: $isChosen, isNewElements: $isNewElements)
            }
        }
    }
}

struct SelectList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SelectedListView(elementStore: ElementalStore())
        }
    }
}
