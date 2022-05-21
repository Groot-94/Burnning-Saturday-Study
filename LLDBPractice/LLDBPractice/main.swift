//
//  main.swift
//  LLDBPractice
//
//  Created by NAMU on 2022/05/20.
//

struct SaturdayStudy {
    
    var discord = [String]()
    
    func startStudy() {
        if discord.count >= 4 {
            print("스터디를 시작합니다.")
        } else {
            print("지각은 100만원입니다.")
        }
    }
    
    func speakPresident(_ person: String) {
        if checkPresident(person) {
            print("키위는 반으로 쪼개고 그루트는 잘라버릴겁니다. 언체인은 음 일단 보류..")
        } else {
            print("감히 회장님의 자리를 탐내지 않도록 합니다.")
        }
    }
    
    func checkPresident(_ person: String) -> Bool {
        guard person == "현이" else {
            return false
        }
        return true
    }
}

let groot = "그루트"
let kiwi = "키위"
let unchain = "언체인"
let hyun2 = "현이"

var study = SaturdayStudy(discord: [])

study.startStudy()
study.discord.append(groot)
study.discord.append(kiwi)
study.discord.append(unchain)
study.discord.append(hyun2)
study.startStudy()

study.speakPresident(kiwi)
study.speakPresident(hyun2)
