///<10870> 피보나치 수 5

let N = Int(readLine()!)!

var firstNumber = 0
var secondNumber = 1
var n: Int {
    get {
        return firstNumber + secondNumber
    }
}
if N >= 3 {
    for _ in 0...(N - 3) {
        let temp = n
        firstNumber = secondNumber
        secondNumber = temp
    }
    print(n)
} else if N == 0 {
    print(0)
} else if N == 1 {
    print(1)
} else if N == 2 {
    print(1)
}








