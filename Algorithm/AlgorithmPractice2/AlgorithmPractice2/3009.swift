//<3009> 네 번째 점
// xList와 yList 각각에서 한번만 쓰인 숫자 출력

var xList: [Int] = []
var yList: [Int] = []
(0..<3).forEach { _ in
    let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
    xList.append(input[0])
    yList.append(input[1])
}

func popUniqueOne(in list: [Int]) -> Int {
    var cloneList = list
    let targetNumber = cloneList[0]
    cloneList.remove(at: cloneList.firstIndex(of: targetNumber)!)
    if !cloneList.contains(targetNumber) {
        return targetNumber
    } else {
        cloneList.remove(at: cloneList.firstIndex(of: targetNumber)!)
        return cloneList[0]
    }
}

print(popUniqueOne(in: xList), popUniqueOne(in: yList))
