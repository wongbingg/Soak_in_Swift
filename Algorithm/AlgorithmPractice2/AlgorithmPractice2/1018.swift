//<1018> 체스판 다시 칠하기
// M x N 크기의 네모판자에서 8x8 만큼을 잘라 체스판의 용도로 사용한다고 할 때 다시 칠해야하는 정사각형의 최소개수
// 8 <= M,N <= 50
//lineStack.forEach{ print($0) }

// 행 인덱스가 0~7, 1~8, 2~9 ,3~10 ... 의 경우의 수
// 열 인덱스가 0~7, 1~8, 2~9, 3~10 ... 의 경우의 수

// 행 인덱스가 0~7 일때, 모든 열 인덱스의 경우 를 고려
// 행인덱스의 경우 x 열 인덱스의 경우 = 모든경우의 수

// 행이 M개 이면 경우의 수는 M - 7
// 열이 N개 이면 경우의 수는 N - 7
// 즉 경우의 수는 (M-7) * (N-7) 개

// 행,렬의 가용인덱스 0 ~ 7, 에서부터 양쪽에 1씩 증가하면 그 다음경우가 된다.

var chessBoard1 = ["WBWBWBWB","BWBWBWBW","WBWBWBWB","BWBWBWBW","WBWBWBWB","BWBWBWBW","WBWBWBWB","BWBWBWBW"]
var chessBoard2 = ["BWBWBWBW", "WBWBWBWB","BWBWBWBW","WBWBWBWB","BWBWBWBW","WBWBWBWB","BWBWBWBW","WBWBWBWB"]

let input = readLine()?.split(separator: " ").map{ Int($0)!} ?? [0]
let validRow = [Int](0...input[0] - 8)
let validColumn = [Int](0...input[1] - 8)

var countList: [Int] = []
var lineStack: [String] = [] // 입력받은 모든 스택
var mappedStackList: [[String]] = [] // 걸러진 스택의 저장

for _ in 1...input[0] {
    let oneline = readLine()!
    lineStack += [oneline]
}

func retrieve(from str: String, range index: [Int]) -> String {
    return String(str[str.index(str.startIndex, offsetBy: index[0])...str.index(str.startIndex, offsetBy: index[1])])
}

// (M-7)*(N-7) 의 경우에 수를 커버할 함수 작성
func filteringStack(M: Int, N: Int) {
    var mappedStack: [String] = [] // 8x8로 걸러진 스택
    for i in (0 + M)...(7 + M) { // 8x8 틀로 뽑아오는 과정 함수화 필요
        mappedStack += [retrieve(from: lineStack[i], range: [0 + N,7 + N])]
    }
    mappedStackList.append(mappedStack)
}

for row in validRow {
    for col in validColumn {
        filteringStack(M: row, N: col)
    }
}

func redrawSquareCount(lhs: [String], rhs: [String]) {
    var count = 0
    for j in 0...7 {
        for k in 0...7 {
            if retrieve(from: lhs[j], range: [k,k]) == retrieve(from: rhs[j], range: [k,k]) {
                continue
            } else {
                count += 1
            }
        }
    }
    countList.append(count)
}

for mapped in mappedStackList {
    redrawSquareCount(lhs: mapped, rhs: chessBoard1)
    redrawSquareCount(lhs: mapped, rhs: chessBoard2)
}

print(countList.min()!)


