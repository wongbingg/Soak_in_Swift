//<11050> 이항 계수1
// 자연수 N과 정수 K가 주어졌을 때, 이항계수를 구하는 프로그램을 작성해라.
// 첫줄에 N 과 K가 주어진다. (1 <= N <= 10  , 0 <= K <= N)
// 결국 N C K 를 구하는 문제

let input = readLine()!.split(separator: " ").map{ Int($0)! }
print(fac(input[0]) / (fac(input[0] - input[1]) * fac(input[1])))
func fac(_ x: Int) -> Int {
    if x <= 1{  // 여기를 if x == 1 로 작성했었는데 메모리 초과가 났다.. < 하나 차이로 메모리가 초과가 안되었다..
        return 1
    }
    return x * fac(x - 1)
}


