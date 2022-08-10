//<10989> 수 정렬하기3
// N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오
// 첫째줄에 수의 개수 N (1 ~ 10000000) 가 주어진다. 둘째 줄 부터 N개의 수가 주어진다. 수는 (~10000)
// sorted 는 O(n*logn) 의 복잡도를 가진다. sorted 메모리 초과

var list = [Int]()
let N = Int(readLine()!)!
(1...N).forEach { _ in
    let input = Int(readLine()!)!
    list.append(input)
}

func quickSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 {return arr}
    
    let pivot = arr[0]
    let leftArr = arr.filter{$0 < pivot}
    let midArr = arr.filter{$0 == pivot}
    let rightArr = arr.filter{$0 > pivot}

    return quickSort(leftArr) + midArr + quickSort(rightArr)
}

list = quickSort(list)
list.forEach { print($0) }

//MARK: - 선택정렬
//func selectionSort(_ list: inout [Int]) {
//    for i in 0..<list.count-1 {
//        var minIdx = i
//        for j in i+1..<list.count {
//            if list[minIdx] > list[j] {
//                minIdx = j
//            }
//        }
//        list.swapAt(minIdx, i)
//    }
//}
//
//selectionSort(&list)
//list.forEach { print($0) }

// MARK: - 버블정렬
//func bubbleSort(_ list: inout [Int]) {
//    for i in 0..<list.count {
//        for j in 0..<(list.count-1-i) {
//            if list[j] > list[j+1] {
//                list.swapAt(j, j+1)
//            }
//        }
//    }
//}
//
//bubbleSort(&list)
//list.forEach { print($0) }
