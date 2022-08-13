//<10989> 수 정렬하기3
// N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오
// 첫째줄에 수의 개수 N (1 ~ 10000000) 가 주어진다. 둘째 줄 부터 N개의 수가 주어진다. 수는 (~10000)
// sorted 는 O(n*logn) 의 복잡도를 가진다. sorted 메모리 초과
// 계수정렬을 사용한다는 블로그 풀이를 보았다 !
// 계속 시간초과, 메모리초과가 되어 "라이노" 님이 만들어두신 FileIO 라는 클래스를 만들어 적용하니 통과 ..!
// 이게 멀까?
import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let FIO = FileIO()
let N = FIO.readInt()
var mockList = Array(repeating: 0, count: 10000)
var inputList = [Int]()
(1...N).forEach { _ in
    let input = FIO.readInt()
    mockList[input-1] += 1
    inputList.append(input)
}
let max = inputList.max()
let list = mockList[0...max!-1]
for (index, num) in list.enumerated(){
    guard num > 0 else { continue }
    let printStr = "\(index + 1)"
    let array = Array(repeating: printStr, count: num)
    print(array.joined(separator: "\n"))
}


//MARK: - 퀵정렬
//func quickSort(_ arr: [Int]) -> [Int] {
//    if arr.count <= 1 {return arr}
//
//    let pivot = arr[0]
//    let leftArr = arr.filter{$0 < pivot}
//    let midArr = arr.filter{$0 == pivot}
//    let rightArr = arr.filter{$0 > pivot}
//
//    return quickSort(leftArr) + midArr + quickSort(rightArr)
//}
//
//list = quickSort(list)
//list.forEach { print($0) }

//MARK: - 선택정렬
//func selectionSort(_ list: inout [Int]) {
//    for i in 0..<list.count-1 {
//        var minIdx = i
//        for j in i+1..<list.count {
//            if list[minIdx] > list[j] {
//                minIdx = j
//            }
//        }
//        list.swapAt(minIdx, i)
//    }
//}
//
//selectionSort(&list)
//list.forEach { print($0) }

// MARK: - 버블정렬
//func bubbleSort(_ list: inout [Int]) {
//    for i in 0..<list.count {
//        for j in 0..<(list.count-1-i) {
//            if list[j] > list[j+1] {
//                list.swapAt(j, j+1)
//            }
//        }
//    }
//}
//
//bubbleSort(&list)
//list.forEach { print($0) }
