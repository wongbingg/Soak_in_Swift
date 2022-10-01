// <11659> 구간 합 구하기 4
// 34분 76200KB 276ms

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let M = input[1]
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var psum = Array(repeating: 0, count: numbers.count+1)
psum[1] = (numbers[0])
for i in 1...numbers.count-1 {
    psum[i+1] = numbers[i] + psum[i]
}
(1...M).forEach { _ in
    let range = readLine()!.split(separator: " ").compactMap { Int($0) }
    print(psum[range[1]] - psum[range[0]-1])
}

// 시간초과 .. ㅋㅋ 누적합을 미리 구해놓고 그것으로 계산하란다

// MARK: - 누적합
/*
 기존풀이는 range 를 이용하여 Array[1..3].reduce(0, +) 를 사용했었는 데 시간초과
 일단 reduce 메서드는 O(N)의 복잡도를 가진다.
 subscript에서 NSArray와 bridged 되면 O(*n*)의 복잡도를 가진다고 나오는데 그렇다면 총 O(N*N) 인가!?
 아마도 이 작업의 시간복잡도가 커서 그런 듯 하다.
 
 뭔가 dp 비슷하게 미리 누적합의 배열을 만들어 놓고 =O(N) , index로 접근한 두 값을 빼줌으로써 O(1)으로 해결
 
 
 <풀이참고>
 https://please-amend.tistory.com/entry/백준-11659번-구간-합-구하기-4-스위프트Swift-풀이-그림-설명
 
 <시간복잡도에 대한 좋은 레퍼런스를 올려둔 블로그>
 https://demian-develop.tistory.com/30
 */
