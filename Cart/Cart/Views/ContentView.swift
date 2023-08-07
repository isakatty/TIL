//
//  ContentView.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

// shopping Cart

import SwiftUI

struct ContentView: View {
//    var productStore: ProductStore
    
    @State var isShowingSheet: Bool = false
    @State var isShowingWebSheet: Bool = false
    @State var realURLString: String = ""
//    @State private var filteredValue = ProductCategory.device
    
    @ObservedObject var cartStore: CartStore = CartStore()
    
    var isEmpty: Bool{
        return cartStore.products.isEmpty
    }
    
    var body: some View {
        NavigationStack{
            
//            Picker(selection: $filteredValue) {
//                Text("전자기기").tag(ProductCategory.device)
//                Text("꾸미기").tag(ProductCategory.decorattion)
//                Text("음식").tag(ProductCategory.food)
//                Text("기타 등등").tag(ProductCategory.etc)
//
//            } label: {
//                Text("")
//            }.pickerStyle(SegmentedPickerStyle())

            
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
