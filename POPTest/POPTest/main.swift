//
//  main.swift
//  POPTest
//
//  Created by hyeon2, unchain, groot, kiwi on 2022/07/02.
//

import Foundation
var 현이맥북 = MacBook(chargeableWattPerHour: 10, currentBattery: 10)

var gucciBag = Bag()

gucciBag.put(item: appleWatchCharger)
gucciBag.put(item: iPadCharger)
gucciBag.put(item: iPhoneCharger)
gucciBag.put(item: macBookCharger)
gucciBag.put(item: macBookSuperCharger)
gucciBag.put(item: 현이맥북)

현이맥북.chargeBattery(charger: iPhoneCharger)
