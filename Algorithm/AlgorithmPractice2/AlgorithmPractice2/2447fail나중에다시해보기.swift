//<2447> 별 찍기 -10
// 재귀적인 패턴으로 별을 찍어보자, N이 3의 거듭제곱 (3, 9, 27 ..)이라고 할 때, 크기 N의 패턴은 NxN 정사각형 모양이다
// 크기 3의 패턴은 가운데에 공백이 있고, 가운데를 제외한 모든 칸에 별이 하나씩 있는 패턴이다
// map{}, String(repeating:,count:), 이용
// 문자열에서 특정 범위에 문자추가 하기 기능?
/// \n으로 나누어진 문자열에 각각에 어떻게 값을 반복 해주어야 될까 고민
/// 사실 문자열 처리가 아닌 배열로 문자열을 끊어서 받으면 그게 곧 출력 시에는 줄바꿈이 될 수 있었다..
/// stack처럼 쌓아놓고 한번에 forEach로 돌려버리면 끝나는 것이었다 ..
let N = Int(readLine()!)!  // 3..9..27 ...

func paintDonut(num: Int, pattern: [String]) {
    if num == 1 {
        pattern.forEach{ print($0)}
    }
    let row1: [String] = pattern.map{ $0 + $0 + $0}
    let row2: [String] = pattern.map{ $0 + String(repeating: " ", count: $0.count) + $0}
    let newPattern: [String] = row1 + row2 + row1
    
    paintDonut(num: num/3, pattern: newPattern)
}

paintDonut(num: N, pattern: ["*"])


















//var star: [String] = ["***","* *"]
//
//print(star[0],star[1],star[0],separator: "\n")
//
//var star2 = star.map{String(repeating: $0, count: 3)} //첫째 마지막 줄 [ "*********","* ** ** *"]
//var star3 = star.map{$0 + String(repeating: " ", count: 3) + $0 } //중간줄 ["***   ***", "* *   * *"]
//
//print(star2[0],star2[1],star2[0],separator: "\n")
//print(star3[0],star3[1],star3[0],separator: "\n")
//print(star2[0],star2[1],star2[0],separator: "\n")
//
//var star2_1 = star2.map{String(repeating: $0, count: 3)}
//var star2_2 = star2.map{$0 + String(repeating: " ", count: 9) + $0 }
//
//var star3_2 = star3.map{$0 + String(repeating: " ", count: 9) + $0 }
//var star3_1 = star3.map{String(repeating: $0, count: 3)}
//
//
//print(star2_1[0],star2_1[1],star2_1[0],separator: "\n")
//print(star3_1[0],star3_1[1],star3_1[0],separator: "\n")
//print(star2_1[0],star2_1[1],star2_1[0],separator: "\n")
//print(star2_2[0],star2_2[1],star2_2[0],separator: "\n")
//print(star3_2[0],star3_2[1],star3_2[0],separator: "\n")
//print(star2_2[0],star2_2[1],star2_2[0],separator: "\n")
//print(star2_1[0],star2_1[1],star2_1[0],separator: "\n")
//print(star3_1[0],star3_1[1],star3_1[0],separator: "\n")
//print(star2_1[0],star2_1[1],star2_1[0],separator: "\n")
