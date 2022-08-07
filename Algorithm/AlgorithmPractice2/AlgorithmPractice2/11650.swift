/*
 <11650> 좌표정렬하기
 2차원 평면 위의 점 N개가 주어진다. 좌표를 x좌표가 증가하는 순으로, x좌표가 같으면 y좌표가 증가하는 순서로 정렬한 다음 출력하는 프로그램을 작성하시오.
 
 첫째 줄에 점의 개수 N (1 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N개의 줄에는 i번점의 위치 xi와 yi가 주어진다. (-100,000 ≤ xi, yi ≤ 100,000) 좌표는 항상 정수이고, 위치가 같은 두 점은 없다.
 */
var list: [(Int,Int)] = []

let n = Int(readLine()!)!
(1...n).forEach { _ in
    let position = readLine()!.split(separator: " ").map { Int($0)! }
    list.append((position[0], position[1]))
}
let result = list.sorted {
    if $0.0 == $1.0 {
        return $0.1 <= $1.1
    } else {
        return $0.0 <= $1.0
    }
}

result.forEach { print("\($0.0) \($0.1)") }


