// <1541> 잃어버린 괄호

func solution() {
    let input = readLine()!.split(separator: "-")
    
    if input.count == 1 {
        let sum = input[0].split(separator: "+").compactMap { Int($0) }.reduce(0, +)
        print(sum)
        return
    }
    var startNum = 0
    if input[0].contains("+") {
        let sum = input[0].split(separator: "+").compactMap { Int($0) }.reduce(0, +)
        startNum = sum
    } else {
        startNum = Int(input[0])!
    }
    for i in 1...input.count-1 {
        if input[i].contains("+") {
            let sum = input[i].split(separator: "+").compactMap { Int($0) }.reduce(0, +)
            startNum -= sum
        } else {
            startNum -= Int(input[i])!
        }
    }
    print(startNum)
}

solution()

// greedy 알고리즘이 쓰인다고 하는데 이게 쓰인것인가..?
// 먼가 애매한 마무리 .. 
