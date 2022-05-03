///<10872> 팩토리얼
/// 0 보다 크거나 같은 정수 N 이 주어지면 N! 을 구하라

func factorial() {
    let N = Int(readLine()!)!
    guard N != 0 else { print(1); return}
    var result = 1
    (1...N).reversed().forEach { num in
        result *= num
    }
    print(result)
}
factorial()

