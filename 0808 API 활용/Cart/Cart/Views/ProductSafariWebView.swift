//
//  ProductSafariWebView.swift
//  Cart
//
//  Created by Ham Seonwoo on 2023/08/07.
//

import SwiftUI
import SafariServices


struct ProductSafariWebView: UIViewControllerRepresentable {
    
    @Binding var urlString : String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}

struct ProductSafariWebView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSafariWebView(urlString: .constant("https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000188447&dispCatNo=10000020002&trackingCd=Cat10000020002_Clickbest&curation=like&egcode=c001_c001&rccode=pc_category_01_a&egrankcode=1&t_page=%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%EA%B4%80&t_click=%EB%A7%8E%EC%9D%B4%EB%B3%B8%EC%83%81%ED%92%88&t_number=1"))
    }
}
