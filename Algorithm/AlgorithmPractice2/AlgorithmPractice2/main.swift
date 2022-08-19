//<11723> 집합
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
let M = FIO.readInt()
var S:UInt32 = 0
var resultList = [String]()
(1...M).forEach { _ in
    let order = FIO.readString().split(separator: " ")
    var number = 0
    if order.count == 2 {
        number = Int(order[1])!
    }
    switch order[0] {
    case "add":
        S |= (1<<(number-1))
    case "remove":
        S -= S & (1<<(number-1))
    case "check":
        resultList.append(String((S & (1<<(number-1)))>>(number-1), radix: 2))
    case "toggle":
        S = S ^ (1<<(number-1))
    case "all":
        S = 0b11111111111111111111
    case "empty":
        S = 0
    default:
        return
    }
}
resultList.forEach { print($0) }
