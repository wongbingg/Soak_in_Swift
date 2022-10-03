// <9372> 상근이의 여행

//let T = Int(readLine()!)!
//
//(1...T).forEach { _ in
//    let pair = readLine()!.split(separator: " ").compactMap { Int($0) }
//    let N = pair[0] // 국가의 수
//    let M = pair[1] // 비행기의 종류
//    var rootDic = [Int:[Int]]()
//    (1...N).forEach { i in
//        rootDic[i] = []
//    }
//
//    (1...M).forEach { i in
//        let root = readLine()!.split(separator: " ").compactMap { Int($0) }
//        rootDic[root[0]]?.append(root[1])
//        rootDic[root[1]]?.append(root[0])
//
//    }
//    print(rootDic)
//}
let T = Int(readLine()!)!

(1...T).forEach { _ in
    let pair = readLine()!.split(separator: " ").compactMap { Int($0) }
    let N = pair[0] // 국가의 수
    let M = pair[1] // 비행기의 종
    (1...M).forEach { i in
        let root = readLine()!.split(separator: " ").compactMap { Int($0) }
    }
    print(N - 1)
}

// ..? 결국 국가의 수 -1 이 정답이다. 왜냐하면 어떤경로를 통하던 간에 국가와 국가간의 이동이 필요하기 때뮨 ?
// 트리구조의 특성인가 ?
