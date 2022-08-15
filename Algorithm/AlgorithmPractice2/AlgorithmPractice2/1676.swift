// <1676> 팩토리얼

//func factorial(_ number: Int) -> Int {
//    var result = 1
//    (1...number).forEach { num in
//        result *= num
//    }
//    return result
//}
//var result = factorial(input)
let input = Int(readLine()!)!
func countZero(factorial: Int) -> Int {
    let one = factorial / 5
    let two = factorial / 25
    let three = factorial / 125
    return one + two + three
}
print(countZero(factorial: input))

// 5팩부터 0 , 10팩부터 00, 15팩부터 000, 20팩부터 0000, 25팩부터 000000,
// 25팩부터는 갑자기 0의 갯수가 2개 늘어난다. 이유는 5의 제곱만큼 나눠지는 구간이 생겼기 때문이다.
// 125팩부터는 0이 3개 늘어날 것이다 이유는 5의 세제곱만큼 나눠지는 구간이 생겼기 때문이다.


// 10을 만들 수 있는 경우는 2x5 인데 , 들어가있는 5의 갯수를 구하면 0의 갯수도 구할 수 있다.
// 5가 몇개들어있나 구하면 0의 갯수를 구할 수 있고, 25로 몇번 나눠지나 구하면 00의 갯수를 구할 수 있고, 125로 몇번 나눠지나 구하면 000의 갯수를 구할 수 있다.
