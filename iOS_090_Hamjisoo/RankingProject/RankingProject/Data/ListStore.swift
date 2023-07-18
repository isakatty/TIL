//
//  ListStore.swift
//  RankingProject
//
//  Created by Ham Seonwoo on 2023/07/16.
//

import Foundation

class ElementalStore: ObservableObject {
    @Published var elements : [ElementAnimation] = []
    @Published var newElements : [ElementAnimation] = []
    
    var membersEmpty: Bool {
        newElements.isEmpty
    }
    
    init(){
    elements = [
        ElementAnimation(name: "엠버 루멘", image: "https://static.wikia.nocookie.net/disney/images/3/36/Profile_-_Ember_Lumen.png/revision/latest?cb=20230330062658", rank: 1),
        ElementAnimation(name: "웨이드 리플", image: "https://static.wikia.nocookie.net/disney/images/0/0f/Profile_-_Wade_Ripple.png/revision/latest?cb=20230330062714", rank: 2),
        ElementAnimation(name: "버니 루멘", image: "https://static.wikia.nocookie.net/disney/images/8/8c/Profile_-_Bernie_Lumen.png/revision/latest?cb=20230330062533", rank: 3),
        ElementAnimation(name: "신더 루멘", image: "https://static.wikia.nocookie.net/disney/images/1/1a/Profile_-_Cinder_Lumen.png/revision/latest?cb=20230330062613", rank: 4),
        ElementAnimation(name: "브룩 리플", image: "https://static.wikia.nocookie.net/disney/images/6/6f/Profile_-_Brook_Ripple.png/revision/latest?cb=20230331041459", rank: 5),
        ElementAnimation(name: "클로드", image: "https://static.wikia.nocookie.net/disney/images/f/f5/Profile_-_Clod.jpg/revision/latest?cb=20230417031210", rank: 7),
        ElementAnimation(name: "게일 쿠물러스", image: "https://static.wikia.nocookie.net/disney/images/0/02/Profile_-_Gale.jpg/revision/latest?cb=20230421222847", rank: 6),
    ]
    }
    // 추가하기 위한 함수
    func addCharac(name: String, image: String, rank: Int){
        let member: ElementAnimation = ElementAnimation(name: name, image: image, rank: rank)
        
        newElements.append(member)
    }
    // 정렬하기 위한 함수
    func sortRankingChars(){
        // 버튼이 눌리면, newElements의 정렬.
        newElements.sort(by: <)
        // sort의 기준을 넣어주었다면, comparable을 채택하지 않았을수도 ?!
    }
    
    func sortNamingChars(){
        // 버튼이 눌리면, newElements의 정렬.
        newElements.sort(by: >)
        // sort의 기준을 넣어주었다면, comparable을 채택하지 않았을수도 ?!
    }
    
    func removeCharac(_ characters : ElementAnimation){
        var index: Int = 0
        
        for tempCharacters in newElements {
            if tempCharacters.id == characters.id {
                newElements.remove(at: index)
                break
            }
            index += 1
        }
        
    }
    func removeCharacAll(){
        newElements.removeAll()
    }
    
    
}
