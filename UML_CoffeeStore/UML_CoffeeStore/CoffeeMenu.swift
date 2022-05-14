//
//  CoffeeMenu.swift
//  asd
//
//  Created by NAMU on 2022/05/13.
//

enum CoffeeMenu: String {
    case ameficano
    case latte
    
    var price: Int {
        switch self {
        case .ameficano:
            return 1000
        case .latte:
            return 2000
        }
    }
}
