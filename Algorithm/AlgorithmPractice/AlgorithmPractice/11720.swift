
//<11720> 숫자의 합

var number = readLine().map{Int($0)!}
if let N = number {
    var sumNumber = 0
    let input = readLine()!
    for i in 1...N {
        sumNumber += Int(String(input[input.index(input.startIndex, offsetBy: i - 1)]))!
    }
    print(sumNumber)
}
