//
//  SwiftUIView.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

import SwiftUI

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
                        // -> enum의 한 값으로 데려온 것이기 때문
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
