//
//  WishListView.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

import SwiftUI

struct WishListView: View {
    var cartStore: CartStore
    
    @Binding var isShowingSheet: Bool
    
    @ObservedObject var productStore: ProductStore = ProductStore()
    
    var body: some View {
        List{
            ForEach(productStore.products) { product in
                VStack(alignment: .leading){
                    AsyncImage(url: URL(string: product.productImageURL)) { image in
                        image
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
                           // add가 눌리면 toggle에 의해 sheet이 내려가고 배열에 추가됨.
                            cartStore.addProduct(product)
                            isShowingSheet = false
                        } label: {
                            Text("add")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                }
            }
            
        }
        .refreshable {
            productStore.fetchFile()
        }
        .onAppear {
            productStore.fetchFile()
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView(cartStore: CartStore(), isShowingSheet: .constant(true))
    }
}
