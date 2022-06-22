/*
<7568> 덩치
*/

let n = Int(readLine()!)!
var list: [(Int,Int)] = []
var result = ""
(1...n).forEach { _ in
    let weightAndHeight = readLine()!.split(separator: " ").map { Int($0)! }
    let person = (weightAndHeight[0], weightAndHeight[1])
    list.append(person)
}
for person in list {
    var biggerCount = 0
    for per in list {
        if person.0 < per.0 && person.1 < per.1 {
            biggerCount += 1
        }
    }
    let rank = biggerCount + 1
    if result == "" {
        result += "\(rank)"
    } else {
        result += " \(rank)"
    }
}
print(result,separator: " ")
