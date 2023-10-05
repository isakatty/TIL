//
//  SupportView.swift
//  consumableIAP
//
//  Created by Jisoo HAM on 10/3/23.
//

import SwiftUI
import StoreKit

struct SupportView: View {
    @State var isManageSubscriptionsSheetPresented: Bool = false
    @State var isOfferCodeRedepmtionPresented: Bool = false
    
    var body: some View {
        Form {
            Button("Subscription management") {
                showManageSubscriptionSheet()
            }
            Button("Redeem code") {
                showOfferCodeRedemption()
            }
            NavigationLink("Request a refund") {
                RefundView()
            }
        }
        .manageSubscriptionsSheet(isPresented: $isManageSubscriptionsSheetPresented)
        .offerCodeRedemption(isPresented: $isOfferCodeRedepmtionPresented)
        
    }
    
    func showManageSubscriptionSheet() {
        isManageSubscriptionsSheetPresented = true
    }
    
    func showOfferCodeRedemption() {
        isOfferCodeRedepmtionPresented = true
    }
    
}

#Preview {
    SupportView()
}
