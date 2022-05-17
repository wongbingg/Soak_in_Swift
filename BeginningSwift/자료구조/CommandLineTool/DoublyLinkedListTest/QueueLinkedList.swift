//
//  QueueLinkedList.swift
//  CommandLineTool
//
//  Created by 이원빈 on 2022/05/17.
//

import Foundation

public class QueueLinkedList<T>: Queue {
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    //MARK: - Queue 프로토콜 준수
    public func enQueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func deQueue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
    
    public var peek: T? {
        return list.first?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return String(describing: list)
    }
}
