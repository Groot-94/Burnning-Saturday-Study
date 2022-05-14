//
//  CafeManager.swift
//  asd
//
//  Created by NAMU on 2022/05/13.
//

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> Coffee? {
        self.money += menu.price
        coffee = Coffee(kind: menu, amount: 1)
        return coffee
    }
}
