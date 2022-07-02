struct MacBook: Portable {
    let maximumWattPerHour: WattPerHour = 100
    let chargeableWattPerHour: WattPerHour
    var currentBattery: WattPerHour
    
    mutating func chargeBattery(charger: Chargeable) {
        var time = 0
        while currentBattery < maximumWattPerHour {
            currentBattery += charger.convert(chargeableWattPerHour: chargeableWattPerHour)
            time += 1
        }
        print(time, "만큼 걸림")
    }
}
