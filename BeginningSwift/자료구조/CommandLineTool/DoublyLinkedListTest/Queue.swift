//
//  Queue.swift
//  CommandLineTool
//
//  Created by 이원빈 on 2022/05/17.
//

import Foundation

public protocol Queue {
    associatedtype Element // 제네릭의 역할
    
    mutating func enQueue(_ element: Element) -> Bool
    mutating func deQueue() -> Element?
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
