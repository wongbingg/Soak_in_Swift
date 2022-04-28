// <2775> 부녀회장이 될테야
// a층 b호에 살려면, (a-1)층 1호 ~ b호까지 사람들의 수의 합만큼 사람들을 데려와 살아야 한다
// k층 n호에 몇명이 살고있나 출력!
// 0층에 n호에는 n명이 살고있다
// 1, 4, 10,20,35,56,84,120,165,220.. 2층
// 1, 3, 6, 10,15,21,28,36,45,55  ... 1층
// 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, ... 0층
// (k-1)층의 수열중, n 번째 까지 모두 더한 값

let T = Int(readLine()!)!
var answerList: [Int] = []

for _ in 1...T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    var nList: [Int] = Array(1...n)
    if k == 0 {
        answerList.append(nList.last!)
        continue
    }
    for _ in 1...k {
        nList = generateNextFloor(nList)
    }
    
    answerList.append(nList.last!)
}

func generateNextFloor(_ lst: [Int]) -> [Int] {
    var resultList: [Int] = []
    var turn = 0
    for _ in lst {
        var designedNumber = 0
        for i in 0...turn {
            designedNumber += lst[i]
        }
        turn += 1
        resultList.append(designedNumber)
    }
    return resultList
}

for answer in answerList {
    print(answer)
}

