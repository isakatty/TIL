//
//  CharacterDetailVeiw.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

import SwiftUI

struct AboutCharacterDetailVeiw: View {
    
    let elements: ElementAnimation
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Gradient(colors: [.indigo, .purple]))
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                AsyncImage(url: URL(string: elements.image)) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 200,height: 200)
                } placeholder: {
                    ProgressView()
                }
                
                Text("\n")
                
                HStack{
                    Spacer()
                    Text("이름")
                        .bold()
                    Spacer()
                    Text("랭킹")
                    Spacer()
                }
                .font(.title3)
                .foregroundColor(.white)
                
                HStack{
                    Spacer()
                    Text("\(elements.name)")
                        .bold()
                    Spacer()
                    //1등한테만 주기 ~ 수정해야함.
                    Text("\(elements.rank)등 🏆")
                    Spacer()
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                Spacer()
                
            }
        }
        .ignoresSafeArea()
    }
}

struct CharacterDetailVeiw_Previews: PreviewProvider {
    static var previews: some View {
        AboutCharacterDetailVeiw(elements: ElementAnimation(name: "엠버 루멘", image: "https://static.wikia.nocookie.net/disney/images/3/36/Profile_-_Ember_Lumen.png/revision/latest?cb=20230330062658", rank: 1))
    }
}
