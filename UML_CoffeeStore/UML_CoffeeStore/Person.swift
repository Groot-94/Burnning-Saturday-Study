//
//  Person.swift
//  
//
//  Created by NAMU on 2022/05/13.
//

class Person {
    let name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if menu.price <= money {
            coffee = shop.order(menu)
            money -= menu.price
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
