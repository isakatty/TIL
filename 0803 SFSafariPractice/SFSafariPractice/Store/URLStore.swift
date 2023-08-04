//
//  URLStore.swift
//  SFSafariPractice
//
//  Created by Ham Seonwoo on 2023/08/03.
//

import Foundation

class URLStore: ObservableObject{
    
    // 왜 @Published?
    // 왜냐면 값을 추가해줄거고 추가된 값을 뷰에 리스트로 그려주려면 값이 변했음을 인지하고 알려줄 친구가 필요해
    // 그걸 이 @Published가 하는 것
    @Published var urlDatas: [URLData] = []
    
    init(){
        urlDatas = [
            URLData(urlName: "유튜브", urlLink: "https://www.youtube.com/"),
            URLData(urlName: "웨이브", urlLink: "https://www.wavve.com/?utm_source=GA&utm_medium=SA&utm_campaign=WAVVE_PC&utm_content=0.%EB%B8%8C%EB%9E%9C%EB%93%9C%ED%82%A4%EC%9B%8C%EB%93%9C&utm_term=%EC%9B%A8%EC%9D%B4%EB%B8%8C&gad=1&gclid=Cj0KCQjwoK2mBhDzARIsADGbjepim0uKQscHoC3xCkeSZN8sj-PxLuJl07qShTGAipXUi2ynJecLeAAaAp5BEALw_wcB"),
        ]
    }
    
    // 리스트에 더해줄 함수가 필요하다 그치 ?
    func addURLData(name: String, link : String) {
        let newURL = URLData(urlName: name, urlLink: link)
        
        urlDatas.append(newURL)
    }
    
}
