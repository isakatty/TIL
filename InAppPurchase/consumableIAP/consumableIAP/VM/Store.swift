//
//  Store.swift
//  consumableIAP
//
//  Created by Jisoo HAM on 10/3/23.
//

import StoreKit

final class Store: ObservableObject {
    /// App store conncect에서 생성하는 제품을 식별하는 ID 배열
    private var productIDs = ["initialCheck", "megaphone"]
    
    @Published var products = [Product]() // 뷰가 그려질때 init을 통해 request 해와서 들어와.
    /// 비소모성 상품에 대한 배열
//    @Published var purchasedNonConsumables = Set<Product>()
    /// 소모성 상품
    @Published var purchasedConsumables = [Product]()
    
    /// 환불처리를 위한 배열
    @Published var entitlements = [Transaction]()
    var transactionListener: Task<Void, Error>?
    
    init() {
        transactionListener = listenForTransactions()
        
        Task {
            // 일단 init되면서 item 불러오기.
            await requestProducts()
            // Must be called after the products are already fetched
            await updateCurrentEntitlements()
        }
    }
    
    @MainActor
    func requestProducts() async {
        do {
            products = try await Product.products(for: productIDs)
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func purchase(_ product: Product) async throws -> Transaction? {
        let result = try await product.purchase()
        switch result {
        case .success(.verified(let transaction)):
            // product type에 따라 분류해서 카운팅
            switch product.type {
            case .consumable:
                purchasedConsumables.append(product)
                // 초성확인권일때
                if product.displayName == productIDs[0] {
                    // 여기서 Persistence.증감 함수 를 호출할게 아니라 updateUserInitialCheck 호출  . . . . ?
                    Persistence.increaseConsumablesCount()
                } else if product.displayName == productIDs[1] { // 여긴 메가폰이 되겟지
                    Persistence.increaseConsumablesCount1()
                }
//            case .nonConsumable:
//                purchasedNonConsumables.insert(product)
            default:
                return nil
            }
            // 결제 성공
            await transaction.finish()
            return transaction
        default:
            return nil
        }
    }
    
    /// 구매가 일어난 이후에도 에러가 발생할 수 있음 -> 거래 업데이트를 실시간으로 청취하여 해결 가능
    private func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            for await result in Transaction.updates {
                await self.handle(transactionVerification: result)
            }
        }
    }
    
    /// 거래된 데이터를 가져오기 위해 존재.
    private func updateCurrentEntitlements() async {
        for await result in Transaction.currentEntitlements {
            if let transaction = await self.handle(transactionVerification: result) {
                entitlements.append(transaction)
            }
        }
    }
    
//    /// IAP에서 consumable, nonconsumable일때 타입에 따라 나눠서 추가.
//    private func addPurchased(_ product: Product) {
//        switch product.type {
//        case .consumable:
//            purchasedConsumables.append(product)
//            Persistence.increaseConsumablesCount()
//        case .nonConsumable:
//            purchasedNonConsumables.insert(product)
//        default:
//            return
//        }
//    }
    
    /// 구매 복원 옵션
    @MainActor
     func restore() async throws {
      try await AppStore.sync()
    }
    
    @MainActor
    @discardableResult
    private func handle(transactionVerification result: VerificationResult<Transaction>) async -> Transaction? {
        switch result {
        case let .verified(transaction):
            guard let product = self.products.first(where: { $0.id == transaction.productID}) else { return transaction }
            
            guard !transaction.isUpgraded else { return nil }
            
            try? await self.purchase(product)
            
            await transaction.finish()
            
            return transaction
        default:
            return nil
        }
    }
}

