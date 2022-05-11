///<10872> 팩토리얼
/// 0 보다 크거나 같은 정수 N 이 주어지면 N! 을 구하라

//func factorial() {
//    let N = Int(readLine()!)!
//    guard N != 0 else { print(1); return}
//    var result = 1
//    (1...N).reversed().forEach { num in
//        result *= num
//    }
//    print(result)
//}
//factorial()

//팩토리얼은 단순 for문으로도 구할 수 있지만, 학습을 위해 재귀를 써 봅시다.
let input = Int(readLine()!)!

func factorial(_ num: Int) -> Int? {
    guard num >= 0 && num <= 12 else { return nil }
    if num <= 1 {
        return 1
    }
    return num * factorial(num - 1)!
}
print(factorial(input)!)
