// <1712> 손익분기점

// 매년 임대료, 재산세, 보험료, 급여 등 A만원의 고정비용
// 한대의 노트북 생산 시 B만원 가변비용
// 노트북의 가격책정 C만원

var input = readLine()?.split(separator: " ").map{ Int($0)! }

if let N = input {
    
    let A = N[0]
    let B = N[1]
    let C = N[2]

    if (C - B) > 0 {
        print((A / (C - B)) + 1)
    } else {
        print("-1")
    }
}


