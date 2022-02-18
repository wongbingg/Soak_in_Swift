
//<2577> 숫자의 개수 블로그 참조 advanced 답

var N = 1
var dic = [Int](repeating: 0, count: 10) //[0,0,0,0,0,0,0,0,0,0]

(0..<3).forEach { _ in
    N *= Int(readLine()!)!
}

while N > 0 {
    let rem = N % 10 // 1의자리 숫자 출력
    dic[rem] += 1    // 만약 0이면 배열의 index0 값에 바로 +1 해주는 방식
    N /= 10          // 1의자리 숫자 날리기 .. 그럼 10의자리 숫자가 1의자리로 오고 .. 0이 될 때 까지 루프반복
}

dic.forEach{print($0)}
