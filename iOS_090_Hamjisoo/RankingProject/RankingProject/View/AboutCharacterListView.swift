//
//  SwiftUIView.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

import SwiftUI

/*
 캐릭터의 정보를 보여주기 위해 구성한 리스트.
 NavigationLink를 통해 각 캐릭터의 정보를 보여줌
 */


struct AboutCharacterListView: View {
    
    var elementStore: ElementalStore
    
    var body: some View {
        NavigationStack{
            List(elementStore.elements){ charic in
                NavigationLink {
                    AboutCharacterDetailVeiw(elements: charic)
                } label: {
                    HStack{
                        //image, phase는 그릇임
                        // url을 통해 이미지를 받아와 그 그릇
                        // placeholder를 없앤 image는 enum의 한 값으로 담아온 것.
                        AsyncImage(url: URL(string: "\(charic.image)")){ image in
                            image
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100,height: 100)
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                        Text(charic.name)
                    }
                }
            }
            .navigationTitle("About Characters")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutCharacterListView(elementStore: ElementalStore())
    }
}
