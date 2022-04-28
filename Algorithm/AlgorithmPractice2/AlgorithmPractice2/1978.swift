//<1978> 소수찾기
// 주어진 수 N개 중에서 소수가 몇 개인지 찾아서 출력
// 1000이하의 자연수

let N = Int(readLine()!)!
let number = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
var primeNumberList = Array<Int>(2...1000)
var count = N

func delete(_ element: Int, in list: inout [Int]) {
    if let index = list.firstIndex(of: element) {
        list.remove(at: index)
    }
}
(3...500).forEach { i in
    for j in 2...333 {
        if (i * j) > 1000 {
            break
        }
        delete((i * j), in: &primeNumberList)
    }
}
delete(4, in: &primeNumberList)

number.forEach { num in
    if !primeNumberList.contains(num) {
        count -= 1
    }
}

print(count)








