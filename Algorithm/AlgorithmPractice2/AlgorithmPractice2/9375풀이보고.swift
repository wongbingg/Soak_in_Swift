//<9375> 패션왕 신해빈

let T = Int(readLine()!)!
(1...T).forEach { _ in
    var dic: [String: Int] = [:]
    let n = Int(readLine()!)!
    (1...n).forEach { _ in
        let element = readLine()!.split(separator: " ")
        let category = String(element[1])
        if dic.keys.contains(category) {
            dic[category]! += 1
        } else {
            dic[category] = 1
        }
    }
    var resultList = [Int]()
    for (_, value) in dic {
        resultList.append(value + 1) // 해당 종류의 옷을 안입을 경우를 추가 1
    }
    let result = resultList.reduce(1, *)
    print(result - 1) // 모든 옷을 안입는 경우를 뺌 1
}

// 하나만 입을 때, 두종류 입을 때, 등 경우에 따라
// [a:1, b:4, c:19] 이건 1개일때(1+4+19) 2개일 때 (1*4 + 4*19 + 1*19)
// 3개 일 때, (1*4*19) 3가지 경우의 합

/*
문제 분석 :
 경우의 수를 구할 때 , 옷을 입을 수 있는 경우들을 따져볼 때 안입을 수 있는 경우까지 포함해
 +1 을 한 값을 모두 곱해주면 전체 조합경우의 수가 나온다
 처음에는 가능한 모든 경우의 수를 구해주려 1종류만 입을 경우의수, 2종류만 입을 경우의 수, 3종류만 입을 경우의 수..
 로 파악하려 했지만, 참고한 풀이에서는 각 종류의 옷을 안입을 경우의수 1까지 포함한 수들을 곱해서 가능한 모든 경우의 수를 출력한 후 , 각 경우가 모두 0일 경우 1가지를 빼준다.
 */
