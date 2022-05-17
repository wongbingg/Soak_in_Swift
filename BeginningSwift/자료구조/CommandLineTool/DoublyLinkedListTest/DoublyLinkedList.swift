//
//  DoublyLinkedList.swift
//  CommandLineTool
//
//  Created by 이원빈 on 2022/05/17.
//

import Foundation

public class Node<T> {
    
    public var value: T
    public var next: Node<T>?
    public var previous: Node<T>?
    
    public init(value: T) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        return String(describing: value)
    }
}

public class DoublyLinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        
        guard let tailNode = tail else { // tail 이 nil인지 검사 = 리스트 비어있는지 검사
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = tailNode // 새로들어올 노드의 '이전 참조' 에 현재 tail 노드로
        tailNode.next = newNode // 현재 tail노드의 '다음 참조' 를 새로들어올 노드로
        tail = newNode // 연결정보 완료했으면 마지막으로 새로운 테일노드 설정
        // 정리하면 새로 들어올 노드를 들어올 당시의 'tail 노드' 와 연결을 서로 해주고
        // 들어올 당시의 'tail 노드' 는 그 당시에는 마지막 노드지만 이제는 마지막 노드의 '이전노드' 가 되므로
        // 새로 들어온 노드가 진짜 'tail' 노드가 되는 것
    }
    
    public func remove(_ node: Node<T>) -> T {
        let prev = node.previous // 제거할 노드의 이전참조
        let next = node.next // 제거할 노드의 다음참조
        
        if let prev = prev { // 현재 맨앞 노드라면 prev가 nil이 된다.
            prev.next = next // 중간에 껴있는 현재 node를 건너뛰는 형태
        } else {
            head = next /// head만 옮겨주면 현재 node 엔 nil이 할당되는 것??
        }
        
        next?.previous = prev // 중간에 껴있는 현재 node를 건너뛰는 형태
        
        if next == nil { // 현재 맨뒤 노드라면, next가 nil이 된다
            tail = prev /// tail만 옮겨주면 현재 node엔 nil이 할당되는 것??
        }
        // 할일을 다 한 참조정보들 메모리에서 없애기.
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) -> ")
            // 문자열 메서드인 append 사용해서 노드의 값을 연결리스트 처럼 -> 로 이어 붙인다.
            current = node.next
            // 다음 반복을 위해 current 가 next 가지게 하기.
        }
        return string + "end"
    }
}
