//
//  main.swift
//  ClosurePractice
//
//  Created by NAMU on 2022/05/27.
//
//MARK: - Step1
struct Avengers {
    let name: String
    
    let throwingKnives: () -> Void = { print("바위를 던집니다.") }
    let hitShield: () -> Void = { print("방패로 내려칩니다.") }
    let Runningaway: () -> Void = { print("도망갑니다.") }
    
    func tabShiftKey(skill: () -> Void) {
        print("\(name) ", terminator: "")
        skill()
    }
}

let hyun2 = Avengers(name: "현이")
let kiwi = Avengers(name: "키위")

hyun2.tabShiftKey(skill: hyun2.throwingKnives)
hyun2.tabShiftKey(skill: hyun2.hitShield)

kiwi.tabShiftKey(skill: kiwi.Runningaway)

kiwi.tabShiftKey {
    print("언체인을 부릅니다.")
}

let unchain = Avengers(name: "언체인")
unchain.tabShiftKey {
    print("나타나서 현이를 말립니다.")
}

hyun2.tabShiftKey {
    print("키위를 반으로 쪼갭니다")
}

unchain.tabShiftKey(skill: unchain.Runningaway)


MARK: - Step2

map : 자신을 호출할 때 파라미터로 전달된 함수를 실행해서 그 결과값을 반환하는 함수다.
reduce : 주어진 콜렉션의 원소를 조건에 맞게 결합시켜 하나의 형태로 만들어준다.
filter : 내부의 값을 걸러서 새로운 값으로 추출 하는 함수다.

MARK:  map Test
var mapTestString = "1+2+3+4+5+6"

print(mapTestString.myMap { $0 })

print(mapTestString.myMap { $0.isNumber })

print(mapTestString.split(separator: "+").map { Int($0) ?? 0 })

print(mapTestString.myMap({ Character in
    Int(String(Character)) ?? 0 > 3 ? String(Character) : nil
}))

MARK: reduce Test
var reduceTestArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print(reduceTestArray.myReduce(0, +))

print(reduceTestArray.myReduce(0, -))

print(reduceTestArray.myReduce(10, +))

MARK: filter Test

var filterTestArray = ["1", "+", "2","-", "3"]

print(filterTestArray)

filterTestArray = filterTestArray.filter { (element: String) in
    guard Int(element) != nil else {
        return false
    }
    return true
}
print(filterTestArray)


filterTestArray = filterTestArray.filter({ String in
    Int(String) ?? 0 > 1
})
print(filterTestArray)


filterTestArray = filterTestArray.filter { Int($0) ?? 0 > 2 }
print(filterTestArray)


filterTestArray = filterTestArray.filter { !Character($0).isNumber }
print(filterTestArray)


let filterTestString = "123asd"
print(filterTestString.myFilter { Character in
    Character.isNumber
})


var dropFirstTestArray = ["1", "+", "2","-", "3"]
print(dropFirstTestArray.dropFirst())


var dropLastTestArray = ["1", "+", "2","-", "3"]
print(dropLastTestArray.dropLast())

MARK: Closure Test
//문맥에서 타입 추론
//단일 표현 클로저에서의 암시적 반환
j//인자 이름 축약
//후행 클로저
var number = [1, 4, 5, 2, 3, 7, 8, 6]

print(number.sorted(by: { (s1: Int, s2: Int) -> Bool in return s1 > s2 } ))
// 클로저의 기본 표현법 by 의 매개변수 값으로 클로저를 사용

// 문맥에서 타입 추론
print(number.sorted(by: {s1, s2 in return s1 > s2}))
/* sorted(by:)의 메소드에서 이미 (Int, Int) -> Bool 타입의 인자가 들어와야 하는걸
 알기 때문에 클로저에서 이 타입들은 생략이 가능하다.*/

// 단일 표현 클로저에서의 암시적 반환
print(number.sorted(by: { s1, s2 in s1 > s2 } ))
// return 하는 값이 하나일 경우에 return 생략이 가능

// 인자 이름 축약
print(number.sorted(by: { $0 > $1 } ))
// 값을 순서대로 $0, $1, $2 등으로 표현하여 인자 입력부분과 in 키워드 부분을 생략

print(number.sorted { $0 > $1 })
// 함수 마지막 인자가 클로저일때, 후행 클로저를 사용하면 () 생략이 가능하다.

// 후행 클로저
//func someNumber(closure: {
//    // 클로저의 내용
//})
// 함수의 마지막 인자가 클로저이면 후위 클로저 사용이 가능하다.

func someNumber() {
    // 클로저의 내용 -> 자주 사용했던 함수도 클로저의 형태
}

//MARK: - Step3

//MARK: My map
extension Array {
    func myMap<T>(input: (Element) -> T) -> [T] {
        var result: [T] = []
        
        for element in self {
            result.append(input(element))
        }
        return result
    }
}

//MARK: My reduce
extension Array {
    func myReduce<T>(firstResult: T, _ closure: (T, Element) -> T) -> T {
        var result = firstResult
        
        for element in self {
            result = closure(result, element)
        }
        return result
    }
}


//MARK: My filter

extension String {
    func myFilter(_ isIncluded: (String.Element) -> Bool) -> String {
        var result = ""
        
        for StringElement in self {
            if isIncluded(StringElement) {
                result += String(StringElement)
            }
        }
        return result
    }
}

extension Array {
    func myFilter(_ closure: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        
        for element in self {
            if closure(element) {
                result.append(element)
            }
        }
        return result
    }
}

