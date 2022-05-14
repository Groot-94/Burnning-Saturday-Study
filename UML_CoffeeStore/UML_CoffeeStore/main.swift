//
//  main.swift
//  asd
//
//  Created by NAMU on 2022/05/13.
//

let namu = Person(name: "namu", money: 3000)
let sangwoo = CafeManager(name: "sangwoo", money: 3000)
let unamedCoffee = CoffeeShop(manager: sangwoo)
namu.buy(.ameficano, at: unamedCoffee)

print(namu.money)
print(namu.coffee?.kind.rawValue)

print(sangwoo.money)
