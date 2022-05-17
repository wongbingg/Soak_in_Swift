import Foundation

var queueLinkedList = QueueLinkedList<String>()
queueLinkedList.enQueue("창식")
queueLinkedList.enQueue("유정")
queueLinkedList.enQueue("주혁")
print(queueLinkedList)
queueLinkedList.deQueue()
print(queueLinkedList)

