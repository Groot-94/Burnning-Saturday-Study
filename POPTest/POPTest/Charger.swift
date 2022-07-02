//
//  Charger.swift
//  POPTest
//
//  Created by hyeon2, unchain, groot, kiwi on 2022/07/02.

import Foundation

struct Charger: Chargeable, Portable {
    var maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        guard chargeableWattPerHour >= maximumWattPerHour else {
            print("충전이 불가능하여 허용 와트시를 낮춥니다.")
            return chargeableWattPerHour
        }
        return maximumWattPerHour
    }
}

let appleWatchCharger = Charger(maximumWattPerHour: 5)
let iPhoneCharger = Charger(maximumWattPerHour: 18)
let iPadCharger = Charger(maximumWattPerHour: 30)
let macBookCharger = Charger(maximumWattPerHour: 96)
let macBookSuperCharger = Charger(maximumWattPerHour: 106)
