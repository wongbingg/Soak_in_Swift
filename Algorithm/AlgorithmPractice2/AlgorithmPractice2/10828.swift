//<10828> 스택
// 정수를 저장하는 스택을 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성
/* 명령들
 push X : 정수 X를 스택에 넣는 연산
 pop : 스택에서 가장 위에있는 정수를 빼고, 그 수를 출력, 만약 스택에 정수가 없는 경우 -1 출력
 size : 스택에 들어있는 정수의 개수를 구한다
 empty : 스택이 비어있으면 1, 아니면 0 출력
 top : 스택의 가장 위에 있는 정수를 출력, 만약 정수가 없는 경우 -1 출력 */
/* 첫째 줄에 주어지는 명령의 수 N(1~10000) , 둘째줄 부터 N개의 명령이 하나씩 주어진다. 주어지는
 정수는 (1~100,000) */

struct IntStack {
    var stack: [Int] = []
    var empty: Int {
        return stack.isEmpty ? 1 : 0
    }
    var size: Int {
        return stack.count
    }
    var top: Int {
        if empty == 1 {
            return -1
        } else {
            return stack[size-1]
        }
    }
    mutating func push(_ num: Int) {
        stack.append(num)
    }
    mutating func pop() -> Int {
        guard empty == 0 else { return -1 }
        return stack.popLast()!
    }
}

let N = Int(readLine()!)!
var intStack = IntStack()
var resultList: [Int] = []
(1...N).forEach { _ in
    let orderText = readLine()!.split(separator: " ").map { String($0) }
    switch orderText[0] {
    case "push" :
        intStack.push(Int(orderText[1])!)
    case "pop" :
        resultList.append(intStack.pop())
    case "size" :
        resultList.append(intStack.size)
    case "empty" :
        resultList.append(intStack.empty)
    case "top" :
        resultList.append(intStack.top)
    default:
        print("nan")
    }
}

resultList.forEach { print($0)}
