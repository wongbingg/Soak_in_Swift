//<11723> 집합

let M = Int(readLine()!)!
var S = Set<Int>()
var resultList = [Int]()
(1...M).forEach { _ in
    guard let order = readLine()?.split(separator: " ") else { return }
    var number = 0
    if order.count == 2 {
        number = Int(order[1])!
    }
    switch order[0] {
    case "add":
        S.update(with: number)
    case "remove":
        S.remove(number)
    case "check":
        S.contains(number) ? resultList.append(1) : resultList.append(0)
    case "toggle":
        if S.contains(number) {
            S.remove(number)
        } else {
            S.update(with: number)
        }
    case "all":
        S = Set<Int>(1...20)
    case "empty":
        S.removeAll()
    default:
        return
    }
}
resultList.forEach { print($0) }
