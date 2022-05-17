import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enQueue(_ element: Element) -> Bool
    mutating func deQueue() -> Element?
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    private var array = Array<T>()
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek: T? {
        return array.first
    }
    
    public init() {}
    public mutating func enQueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    public mutating func deQueue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}

var queueArray = QueueArray<String>()
queueArray.enQueue("창식")
queueArray.enQueue("유정")
queueArray.enQueue("주혁")
print(queueArray)
print(queueArray.deQueue())
print(queueArray)

