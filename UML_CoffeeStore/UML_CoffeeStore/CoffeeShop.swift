//
//  CoffeeShop.swift
//
//
//  Created by NAMU on 2022/05/13.
//

class CoffeeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee? {
        return manager.brew(menu)
    }
}
