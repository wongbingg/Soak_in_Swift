//<2581> 소수
// 자연수 M과 N 사이의 소수를 찾아서 이들의 합과 최솟값을 찾아라

let M = Int(readLine()!)!
let N = Int(readLine()!)!

var primeNumberList = Array<Int>(2...N)
var naturalNumberList = Array<Int>(M...N)
var resultPrimeNumberList:[Int] = []

func delete(_ element: Int, in list: inout [Int]) {
    if let index = list.firstIndex(of: element) {
        list.remove(at: index)
    }
}
(3...(N / 2)).forEach { i in
    for j in 2...3333 {
        if (i * j) > 10000 {
            break
        }
        delete((i * j), in: &primeNumberList)
    }
}
delete(4, in: &primeNumberList)

naturalNumberList.forEach { i in
    if primeNumberList.contains(i) {
        resultPrimeNumberList.append(i)
    }
}
if resultPrimeNumberList.count == 0 {
    print(-1)
} else {
    print(resultPrimeNumberList)
    print(resultPrimeNumberList.reduce(0, +))
    print(resultPrimeNumberList.min()!)

}


