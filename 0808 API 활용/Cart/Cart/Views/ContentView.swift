//
//  ContentView.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

// TO DOs
// 1. ProductStore
// 1) JSON 요청 보내기 (완)
// 2) reponse의 statuscode에 따른 예외 처리하기
//  - 열거형 만들고
//  - 그 열거형을 리턴한다.
//  - 리턴값 받는 쪽에서 switch로 분기하여 팝업창 적당히 띄우기.

// 2. CartStore
// 1) 처음에 실행할 때 (onAppear), UserDefaults를 사용하여 데이터 가져오기
// 2) 카트에 저장될 때, 업데이트된 값을 UserDefaults를 사용하여 저장하기


import SwiftUI

struct ContentView: View {
    
    @State var isShowingSheet: Bool = false
    @State var isShowingWebSheet: Bool = false
    @State var realURLString: String = ""
    
    @ObservedObject var cartStore: CartStore = CartStore()
    
    var isEmpty: Bool{
        return cartStore.products.isEmpty
    }
    
    var body: some View {
        NavigationStack{
            
            if isEmpty {
                Spacer()
                Image(systemName: "camera.metering.unknown").font(.largeTitle)
                Text("Nothing's in here")
            }
            
            List {
                ForEach(cartStore.products){ product in
                    
                    VStack(alignment: .leading){
                        AsyncImage(url: URL(string: product.productImageURL)) { Image in
                            Image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                        } placeholder: {
                            ProgressView()
                        }
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(product.productName)")
                                Text("\(product.changedPrice)")
                            }
                            Spacer()
                            
                            Button {
                                realURLString = product.productURL
                                isShowingWebSheet = true
                            } label: {
                                Text("BUY")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    
                }.onDelete { IndexSet in
                    cartStore.removeProduct(at: IndexSet)
                }
            }
            .navigationTitle("Shopping Cart")
            .toolbar{
                ToolbarItem {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("ADD")
                    }

                }
            }
            .sheet(isPresented: $isShowingSheet) {
                WishListView(cartStore: cartStore, isShowingSheet: $isShowingSheet)
            }
            .sheet(isPresented: $isShowingWebSheet) {
                ProductSafariWebView(urlString: $realURLString)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
