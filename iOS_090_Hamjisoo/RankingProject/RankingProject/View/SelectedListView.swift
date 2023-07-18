//
//  SelectList.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

// swipeAction에서 휴지통 버튼을 눌렀을때 alert 작동하여 진짜 지울건지 확인할 수 있으면 좋겠을까..?
// 아님 전체 삭제 버튼을 넣고 거기서 진짜 삭제할건지 물어보는게 좋을까 ? - 완!

// elements.membersEmpty 가 false일때 정렬 뷰를 보여주고
// true일 때 아예 보여주지 않는 방식도 있음 !!! 👍



enum PickerName: String, CaseIterable {
    case rank = "rank"
    case name = "name"
}


import SwiftUI


struct SelectedListView: View {
    @ObservedObject var elementStore: ElementalStore
    
    /*
     밑에 boolean 값 2개는
     - isChosen : 값이 true일때 modalView가 보여지기 위해 생성
     - isDeletedAllNewElements : 전체 삭제 버튼을 눌렀을때, alert를 통해 확인창을 띄우기 위해 생성.
     */
    @State var isChosen: Bool = false
    @State var isDeletedAllNewElements: Bool = false
    
    
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
                    }
                    .swipeActions {
                        Button {
                            elementStore.removeCharac(characs)
                        } label: {
                            Image(systemName: "trash.circle.fill")
                        }
                    }.tint(.red)
                }
                Spacer()
                //정렬을 위한 버튼들을 모아놓은 것 + 질문..
                Group{
                    HStack{
                        //❓🔨 ControlGroup으로 묶은 뒤 disabled 적용시 버튼의 활성 상태 변경은 바뀌나, 버튼이 먹히지 않음.
                        if elementStore.membersEmpty == false {
                            ControlGroup{
                                Button {
                                    elementStore.sortRankingChars()
                                    print("랭킹")
                                } label: {
                                    Text("Ranking")
                                }
                                Button {
                                    elementStore.sortNamingChars()
                                    print("가나다")
                                } label: {
                                    Text("가나다")
                                }
                            }
                        }
                            
                    }
                }
                .navigationTitle("선택된 캐릭터")
                // 화면 상단의 두 버튼을 위한 toolbar와 각 툴바가 작동되었을 때,
                // 발생한 action들( 삭제 버튼 - alert, 추가 버튼 - sheet)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            if elementStore.membersEmpty {
                                return
                            }
                            isDeletedAllNewElements = true
                        } label: {
                            Text("전체 삭제")
                        }.disabled(elementStore.membersEmpty)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isChosen = true
                        } label: {
                            Text("추가")
                        }
                    }
                }
                .alert(isPresented: $isDeletedAllNewElements) {
                    Alert(title: Text("캐릭터 전체를 삭제하시겠습니까 ? "),primaryButton: .destructive(Text("Delete")) {
                        elementStore.removeCharacAll()
                    },
                          secondaryButton: .cancel())
                }
                .sheet(isPresented: $isChosen) {
                    CharacterListView(elementStore: elementStore, isChosen: $isChosen)
                }
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
