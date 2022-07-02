//
//  Portable.swift
//  POPTest
//
//  Created by hyeon2, unchain, groot, kiwi on 2022/07/02.
//

import Foundation

protocol Portable {}

struct Bag {
    var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
}
