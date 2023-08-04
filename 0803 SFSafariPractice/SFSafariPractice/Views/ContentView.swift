//
//  ContentView.swift
//  SFSafariPractice
//
//  Created by Ham Seonwoo on 2023/08/03.
//

/*
 
- 화면에 웹사이트 목록을 나타내봅시다
- 처음엔 아무것도 없겠죠
- "추가" 버튼을 눌러서 웹사이트 제목과 주소를 입력받아 목록에 추가할 수 있게 합시다
- 추가된 내용은 원하면 삭제도 하게 해줍시다
- 목록에서 특정 항목을 누르면 해당 웹사이트가 화면에 나타나도록 합시다

- 시간 좀 남으면 UserDefaults에 목록이 저장되어 다음에 앱을 실행해도 목록이 유지되도록 합시다

 */


import SwiftUI

struct ContentView: View {
    @ObservedObject var urlStore: URLStore = URLStore()
    @State var isSheetOn : Bool = false
    @State var isSecondSheetOn : Bool = false
    
    @State var realUrl:String = ""
    
    // 여기서 state로 걸어주ㅓ야 가능한데 foreach로 돌리고 있는 저 링크에 대해서 어떻게 접근을 하지 ?
//    @State var urlString : String = ""
    // 해결 완 -> 새로운 변수를 주고 버튼을 눌렀을때 거기에 할당시키고 그 링크를 전달해.
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(urlStore.urlDatas) { url in
                    Button {
                        realUrl = url.urlLink
                        
                        isSecondSheetOn = true
                    } label: {
                        Text(url.urlName)
                    }
                    .sheet(isPresented: $isSecondSheetOn) {
                        SFSafariWebView(urlString: $realUrl)
                        // 결제 대행사를 사용할때 전체 화면을 보여줄건지 말지 !!
                            .presentationDetents(
                                [.medium, .large]
                            )
                    }

                }
            }
            .navigationTitle("Web Links")
            .toolbar {
                ToolbarItem {
                    Button {
                        isSheetOn = true
                    } label: {
                        Label("ADD", systemImage: "text.badge.plus")
                    }

                }
            }
            .sheet(isPresented: $isSheetOn) {
                ListEditView(urlStore: urlStore, isSheetOn: $isSheetOn)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
