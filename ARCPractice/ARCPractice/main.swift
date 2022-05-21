
import Foundation

//MARK: - Step 1

class OuterClass {
    var innerInstance = InnerClass()
}

class InnerClass {
}

func printMemoryAddress() {
    var outerInstance: OuterClass = OuterClass()
    print("----지역변수 테스트----")
    // 지역변수 outerInstance의 메모리 주소를 출력합니다.
    withUnsafePointer(to: &outerInstance) { value in
        print(value)
    }

    withUnsafePointer(to: &outerInstance.innerInstance) { value in
        print(value)
    }

    print("----힙메모리 테스트----")
    // 지역변수 outerInstance가 실제로 가리키는 메모리 주소를 출력합니다.
    print(Unmanaged.passUnretained(outerInstance).toOpaque())
    print(Unmanaged.passUnretained(outerInstance.innerInstance).toOpaque())
}

printMemoryAddress()
//MARK: 전역변수 테스트
print("")
print("----전역변수 테스트----")
var outerInstance: OuterClass = OuterClass()

// 지역변수 outerInstance의 메모리 주소를 출력합니다.
withUnsafePointer(to: &outerInstance) { value in
    print(value)
}

withUnsafePointer(to: &outerInstance.innerInstance) { value in
    print(value)
}

print("____힙메모리 테스트----")
// 지역변수 outerInstance가 실제로 가리키는 메모리 주소를 출력합니다.
print(Unmanaged.passUnretained(outerInstance).toOpaque())
print(Unmanaged.passUnretained(outerInstance.innerInstance).toOpaque())
print("")

//MARK: - Step 2
class ContainerClass {
    var contentInstance = ContentClass()

    init() {
        print("생성")
    }

    deinit {
        print("해제")
    }
}

class ContentClass {

}

//MARK: 함수내부 테스트
func experiment_ReferenceCounting() {
    var containerInstance: ContainerClass? = ContainerClass()
    print("첫번째 : \(CFGetRetainCount(containerInstance))")

    var containerInstance2: ContainerClass? = containerInstance
    print("두번째 : \(CFGetRetainCount(containerInstance))")
    
    containerInstance2 = nil
    print("세번째 : \(CFGetRetainCount(containerInstance))")
}

experiment_ReferenceCounting()
print("")

//MARK: 전역변수 테스트
var containerInstance: ContainerClass? = ContainerClass()
print("첫번째 : \(CFGetRetainCount(containerInstance))")

var containerInstance2: ContainerClass? = containerInstance
print("두번째 : \(CFGetRetainCount(containerInstance))")

containerInstance = nil
containerInstance2 = nil
