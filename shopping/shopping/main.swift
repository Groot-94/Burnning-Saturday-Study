//
//  main.swift
//  practice
//
//  Created by Kiwon Song on 2022/04/15.
//

import Foundation

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
//buy()


func checkProductNumber(productNumber: Int) throws -> Int {
    guard productsList.count > productNumber else { throw SomeError.productNumberError }
    return productNumber
}


func checkInventory(productNumber: Int) throws -> Int {
    guard productsList[productNumber] != nil else { throw SomeError.inventoryError }
    return productNumber
}

func inputProductNumber() -> String {
    print("상품 번호를 입력해 주세요. : " , terminator: "")
    guard let inputNumber = readLine(), inputNumber != "" else { print("상품 번호를 입력해 주세요."); return ""}
    // readLine 공백 입력 처리 방법
    return inputNumber
}

func mapNumber(input:String) throws -> Int {
    if let inputNumber = Int(input) {
        return inputNumber
    } else {
        throw SomeError.productNumberError
    }
    
}
func checkBudget() throws -> String {
    if budget == 0 {
        throw SomeError.budgetError
    } else {
        budget -= 1000
        return "구매성공"
    }
}

while true {

    do {
        
        let number = try mapNumber(input: inputProductNumber())
        let varifiedProductNumber = try checkProductNumber(productNumber: number)
        let productNumber = try checkInventory(productNumber: varifiedProductNumber)
        let productName = productsList[productNumber]
        if let name = productName {
            print("\(productNumber)번 상품은 \(name)입니다")
        }
        if productsList[productNumber] != nil && budget != 0 {
            productsList[productNumber] = nil
        }
        print(try checkBudget())
        print("남은예산: \(budget)")
    }


catch SomeError.productNumberError {
    print("존재하지 않는 상품 번호 입니다.")
}catch SomeError.budgetError {
    print("예산이 부족합니다.")
}catch SomeError.inventoryError {
    print("품절 된 상품입니다.")
}

}
