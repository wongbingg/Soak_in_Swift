//<11047> 동전 0

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var K = input[1]
var coinValueList = [Int]()
(1...input[0]).forEach { _ in
    let coinValue = Int(readLine()!)!
    coinValueList.append(coinValue)
}
var count = 0
coinValueList.reversed().forEach { value in
    if K / value > 0 {
        count += K / value
        K %= value
    }
}
print(count)
