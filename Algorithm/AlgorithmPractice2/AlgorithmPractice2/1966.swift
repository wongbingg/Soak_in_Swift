// <1966> 프린터 큐
//5:10 시작

// Queue 자료구조에 쌓인다 FIFO 구조로 프린트가 된다. 근데 상근이가 새롭게 개발했다. 밑에.

// 1. 현재 Queue의 가장 앞에 있는 문서의 '중요도' 를 확인한다.
// 2. 나머지 문서들 중 현재 문서보다 중요도가 높은 문서가 하나라도 있다면, 이 문서를 인쇄하지 않고, Queue의
// 가장 뒤에 재배치 한다. 그렇지 않다면 바로 인쇄한다.

// ex) Queue에 4개의 문서 ABCD가 있고, 중요도가 2143 이라면 , C를 인쇄, D, A, B 순으로 출력
// 현재 Queue에 있는 문서의 수와 중요도가 주어졌을 때, 어떤 한 문서가 몇 번째로 인쇄되는지 알아내보자
// 예상. 결론은 중요도 순서대로 내림차순으로 출력이 되는 것이 아닌가 ? 스위칭에도 순번이 해당하는지 ? X
// 119111 같은 경우 현재 첫번째있는 1 이 언제 출력되는가를 확인해야할 때 , 그 1에 대한 추적이 필요하지 않은가
// 첫번째 인덱스였던 1 을 추적하는 방법은 ? 요소별 identifier 를 주는 방법이 없을 까 ?
// while 문이 돌 때마다 trackedIndex 에 -1 씩 해주어 옮겨주었다.


struct Stack {
    var stack: [Int] = []
    var head: Int {
        return stack[0]
    }
    var count: Int {
        return stack.count
    }
    var isEmpty: Bool {
        return stack.isEmpty ? true : false
    }
    var isTopPriority: Bool {
        return head == stack.max() ? true : false
    }
    mutating func enqueueElement(_ element: Int) {
        stack.append(element)
    }
    mutating func dequeueElement() -> Int? {
        if isTopPriority {
            let popedElement = stack.removeFirst()
            return popedElement
        } else {
            let popedElement = stack.removeFirst()
            stack.append(popedElement)
            return nil
        }
    }
}

var resultList: [Int] = []
let T = Int(readLine()!)!
(1...T).forEach { _ in
    let indicator = readLine()!.split(separator: " ").map { Int($0)! }
    let elements = readLine()!.split(separator: " ").map { Int($0)! }
    var stack = Stack()
    var count = 0
    let listCount = indicator[0]
    var trackedIndex = indicator[1]
    
    elements.forEach { number in
        stack.enqueueElement(number)
    }
    
    let trackedElement = stack.stack[trackedIndex]
    
    while stack.isEmpty == false {
        if trackedIndex < 0 {
            trackedIndex = stack.count - 1
        }

        if let result = stack.dequeueElement() {
            count += 1
            if result == trackedElement && trackedIndex == 0 {
                resultList.append(count)
                break
            } else {
                trackedIndex -= 1
            }
        } else {
            trackedIndex -= 1
        }
    }
}

resultList.forEach { print($0) }
