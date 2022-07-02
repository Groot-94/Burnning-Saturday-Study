//feat-MacBook 브랜치로 이동해 맥북을 구현합니다.
//맥북은 프로퍼티로 다음을 갖습니다.
//기기의 허용 충전 와트시
//현재 저장된 배터리용량 (와트시)
//최대 배터리 용량 (100와트시)
//맥북은 메서드로 다음을 갖습니다.
//chargeBattery(charger: Chargeable) : 충전기를 활용해 배터리를 완전히 충전한 뒤 충전에 걸린 시간을 print 합니다.

struct MacBook {
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
