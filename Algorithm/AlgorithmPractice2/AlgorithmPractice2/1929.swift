//<1929> 소수구하기 시간초과
// M~N 사이의 소수 모두 출력하기
// 1 <= M <= N <= 1,000,000
// 에라토스테네스의 체 를 학습 후 블로그 인용


let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
let M = input[0]
let N = input[1]

var primeNumberList = Array<Int>(repeating: 0, count: N + 1) // [0,0,0,0,0....]
(2...N).forEach { i in
    primeNumberList[i] = i
}

for j in 2...N {
    if primeNumberList[j] == 0 {continue}
    for k in stride(from: j + j, through: N, by: j) {
        primeNumberList[k] = 0
    }
}

for w in M...N {
    if primeNumberList[w] != 0 {
        print("\(primeNumberList[w])")
    }
}



















//var dummyNumbers = Array<Int>()
//var primeNumberList = Array<Int>(2...N)
//
//(2...N).forEach { i in
//    for j in 2...N { //생략할 수 있는 경우가 여러번 나옴
//        if (i * j) > N {
//            break
//        }
//        dummyNumbers.append(i * j)
//    }
//}
//
//delete(dummyNumbers, in: &primeNumberList)
//delete(Array<Int>(1..<M), in: &primeNumberList)
//
//func delete(_ element: [Int], in list: inout [Int]) {
//    for i in element{
//        if let index = list.firstIndex(of: i) {
//            list.remove(at: index)
//        }
//    }
//}
//
//primeNumberList.forEach { primeNumber in
//    print(primeNumber)
//}


