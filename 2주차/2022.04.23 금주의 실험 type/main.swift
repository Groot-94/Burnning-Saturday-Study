//
//  main.swift
//  2022.04.23 금주의 실험 type
//
//  Created by unchain123 on 2022/04/22.
//
//enum SomeError: Error {
//    case outOfStock
//    case notEnoughMoney
//
//    var massege: String {
//        switch self {
//        case .outOfStock:
//            print("재고가없습니다.")
//        case .notEnoughMoney:
//            print("돈이없습니다.")
//        }
//}

struct Shop {
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    var productsPrice = 1000
    
    mutating func restoredGoods(productNumber: Int) {
        print(productsList[productNumber]!)
        productsList[productNumber] = nil
    }
    
    func showRemainList() {
        let products = productsList.compactMap( {$0} )
        print(products)
    }
    
    mutating func purchaseProducts(productNumber: Int, camperName: inout Camper) {
        if productsList[productNumber] == nil {
            print("품절된 상품입니다.")
        } else {
            camperName.payMoney(price: productsPrice, productNumber: productNumber)
            restoredGoods(productNumber: productNumber)
            print(camperName.budget)
        }
        showRemainList()
    }
    mutating func checkInputNumber(choice: String, camperName: inout Camper) {
        if let number = Int(choice), number >= 0, number <= 5 {
            purchaseProducts(productNumber: number, camperName: &camperName)
        } else {
            print("품절된 상품입니다.")
        }
    }
}

struct Camper {
    var budget: Int = 2000
    
    mutating func payMoney(price: Int, productNumber: Int) {
        if budget > 0 {
            budget -= yagomGoodsShop.productsPrice
            print("구매 완료되었습니다. 남은 제품은 아래와 같습니다.")
        } else {
            print("잔액이 부족하여 구매할 수 없습니다.")
        }
    }
    
    func selectProducts(store: inout Shop) {
        while budget >= 0 {
            print("구매를 원하는 상품의 숫자를 선택하세요")
            guard let choice = readLine() else {
                print("잘못된 선택입니다.")
                continue
            }
            store.checkInputNumber(choice: choice)  }
    }
    func giveNotice() {
        if budget >= 0 {
            print("잔액이 부족하여 구매할 수 없습니다.")
        } else {
            print("구매 완료되었습니다. 남은 제품은 아래와 같습니다.")
        }
    }
}

var yagomGoodsShop: Shop = Shop()
var americaGoodsShop: Shop = Shop()
var unchain: Camper = Camper()
var groot: Camper = Camper()
var kiwi: Camper = Camper()
var hyun2: Camper = Camper()

unchain.selectProducts(store: &yagomGoodsShop)
unchain.selectProducts(store: &americaGoodsShop)
