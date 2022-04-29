//<4948> 베르트랑 공준
// n 보다크고, 2n 보다 작거나 같은 소수의 개수를 구하라

//let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
//let M = input[0]
//let N = input[1]
//


var countList: [Int] = []

while true {
    var count = 0
    let n = Int(readLine()!)!
    if n == 0 {
        break
    }
    
    var primeNumber = Array<Int>(repeating: 0, count: (n * 2) + 1) // [0,0,0,0,0....]
    (2...(n * 2)).forEach { i in
        primeNumber[i] = i
    }
    
    for j in 2...(n * 2) {
        if primeNumber[j] == 0 {continue}
        for k in stride(from: j + j, through: (n * 2), by: j) {
            primeNumber[k] = 0
        }
    }
    
    for w in (n + 1)...(n * 2) {
        if primeNumber[w] != 0 {
            count += 1
        }
    }
    countList.append(count)
}

countList.forEach { num in
    print(num)
}

