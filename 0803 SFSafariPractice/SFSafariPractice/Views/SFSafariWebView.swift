//
//  SFSafariWebView.swift
//  SFSafariPractice
//
//  Created by Ham Seonwoo on 2023/08/04.
//

// 국룰 코드이겠거니.. -> safariServices 프레임워크를


import SwiftUI
import SafariServices

struct SFSafariWebView: UIViewControllerRepresentable {
    
    // 설명 요청을 드리자 !!!
    @Binding var urlString : String
//    var urlString : String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}

struct SFSafariWebView_Previews: PreviewProvider {
    static var previews: some View {
        SFSafariWebView(urlString: .constant("https://techit.education"))
    }
}
