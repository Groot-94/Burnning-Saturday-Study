protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}

typealias WattPerHour = Int
typealias Watt = Int
