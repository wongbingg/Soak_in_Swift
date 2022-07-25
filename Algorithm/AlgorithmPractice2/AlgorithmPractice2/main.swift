// <11866> 요세푸스 문제0
// 1번~ N번까지 N 명의 사람이 원을 이루고 앉아있고, 양의정수 K(<= N) 이 주어진다. 이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속 해나간다. 이 과정은 N명의 사람이 모두 제거될 때까지 계속된다. 원에서 사람들이 제거되는 순서를 (N,K) - 요세푸스 순열 이라고 한다. 예를들어 (7,3) -요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4> 이다. N과 K가 주어지면 (N,K)-요세푸스 순열을 구하는 프로그램을 작성하라
// 첫째 줄에 N과 K가 빈 칸을 사이에 두고 순서대로 주어진다. (1 <= K <= N <= 1,000)
// 원형 연결리스트를 이용하면 간편하게 풀 수 있을 것 같다..

class Node<T:Equatable>: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data == rhs.data
    }
    
    var data: T
    var next: Node<T>?
    
    init(_ data: T) {
        self.data = data
        self.next = nil
    }
}

class CircleLinkedList<T: Equatable> {
    var head: Node<T>?
    var isEmpty: Bool {
        head == nil
    }
    var peek: T? {
        head?.data
    }
    
    func appendList(data: [T]) {
        data.forEach { append(data: $0) }
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data)
            return
        }
        let newNode = Node(data)
        if head?.next == nil {
            head?.next = newNode
            newNode.next = head
            head = newNode
        } else {
            newNode.next = head?.next
            head?.next = newNode
            head = newNode
        }
    }
    
    func delete() -> T? {
        if head?.next == head {
            var headData = head?.data
            head = nil
            return headData
        }
        var node = head
        var data = node?.next?.data
        node?.next = node?.next?.next
        return data
    }
    
    func clear() {
        head = nil
    }
}

func josephus() {
    var result: [String] = []
    let list = CircleLinkedList<Int>()
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    list.appendList(data: Array<Int>(1...input[0]))
    
    while list.isEmpty == false {
        (1..<input[1]).forEach { _ in
            list.head = list.head?.next
        }
        result.append(String(list.delete()!))
    }
    
    print("<\(result.joined(separator: ", "))>")
}

josephus()
