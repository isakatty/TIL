//
//  ListEditView.swift
//  SFSafariPractice
//
//  Created by Ham Seonwoo on 2023/08/04.
//

import SwiftUI

struct ListEditView: View {
    
    @ObservedObject var urlStore: URLStore
    @Binding var isSheetOn: Bool
    
    
    @State var name: String = ""
    @State var link: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                HStack{
                    Text(" 링크 이름 :")
                    TextField("링크 이름을 입력하세요", text: $name)
                }
                HStack{
                    Text(" 링크 주소 :")
                    TextField("링크 주소을 입력하세요", text: $link)
                        .onTapGesture {
                            link = "https://"
                        }
                }
            }.formStyle(.columns)
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        urlStore.addURLData(name: name, link: link)
                        isSheetOn.toggle()
                    } label: {
                        Text("Submit")
                    }

                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isSheetOn.toggle()
                    } label: {
                        Text("Cancel")
                    }

                }
                
            }
        }.padding(10)
        
    }
}

struct ListEditView_Previews: PreviewProvider {
    static var previews: some View {
        
        ListEditView(urlStore: URLStore(), isSheetOn: .constant(true))
        
    }
}
