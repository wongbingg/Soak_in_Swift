// <1764> 듣보잡
// 22분 걸림
// 86048KB, 124ms 시간이 좀 많이 걸렸다.
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var personDictionary = [String: Int]()
var resultList = [String]()
(1...input[0]).forEach { _ in
    let neverHeardPerson = readLine()!
    if personDictionary.keys.contains(neverHeardPerson) {
        personDictionary[neverHeardPerson]! += 1
    } else {
        personDictionary[neverHeardPerson] = 1
    }
}
(1...input[1]).forEach { _ in
    let neverSeenPerson = readLine()!
    if personDictionary.keys.contains(neverSeenPerson) {
        personDictionary[neverSeenPerson]! += 1
    } else {
        personDictionary[neverSeenPerson] = 1
    }
}
personDictionary.keys.forEach { key in
    if personDictionary[key] == 2 {
        resultList.append(key)
    }
}
print(resultList.count)
resultList.sorted().forEach { print($0)}
