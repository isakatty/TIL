//
//  CharacterListView.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

/*
 새로 발견된 문제
 
 다중 선택한 후 취소 선택을 눌렀을때 새로 추가된 배열의 요소를 없애야하는데 그냥 취소가 되게 구현을 해놓았음.
 -> 어떻게 해결 해야할까 ?
 
 당장의 치료로는
 다중 선택이 아닌 하나씩 선택하는 것으로 변경하고 버튼을 누르면 바로 sheet창이 내려가면서 추가되고,
 취소 기능은 아예 선택을 하지 않을때 사용할 수 있게 변경.
 
 원하는 기능을 구현했다고 생각할 수 있을까?
 */

import SwiftUI

struct CharacterListView: View {
    // 새로 할당을 하면 결국 새로운 ElementalStore라는 것을 만들어서 주는 결과로 이어져.
    // 그럼 연결된 뷰와의 값이 연동이 안되는 것.
    @ObservedObject var elementStore: ElementalStore
    
    @Binding var isChosen: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                // 각 리스트는 버튼으로 구성이 되어, 버튼의 action 부분에 추가 함수를 넣어줌.
                // 처음에 다중 선택을 하고 확인을 눌렀을때, 화면이 내려가게 만들어서 확인 버튼이 계속 남아있는것.
                // 혹시 선택을 하지 않고 추가 화면을 끄고 싶을때, 취소 버튼을 누르면 sheet에 연결되는 boolean 값을 false로
                // 넣어주어 내려가게 만듦.
                List(elementStore.elements){ chars in
                    Button {
                        //버튼을 눌렀을때, 그 값을 새 배열에 담고 싶은데 뭘까 -> 함수를 사용하여 추가
                        elementStore.addCharac(name: chars.name, image: chars.image, rank: chars.rank)
                        isChosen = false
                    } label: {
                        HStack{
                            AsyncImage(url: URL(string: "\(chars.image)")){ image in
                                image
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 100,height: 100)
                            }placeholder: {
                                ProgressView()
                            }
                            Spacer()
                            Text(chars.name)
                        }
                    }
                }
            }//Vstack
            .navigationTitle("Elemental")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isChosen = false
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isChosen = false
                    } label: {
                        Text("확인")
                    }
                }
            }
        }//NavigationStack
    }//body
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CharacterListView(elementStore: ElementalStore(), isChosen: .constant(true))
        }
    }
}
