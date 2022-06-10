// <1920> 수 찾기
// N개의 정수가 A[1],A[2],A[3]...A[N] 이 주어졌을 때, 이 안에 X라는 정수가 존재하는지 알아내는 프로그램
// 정수의 범위는 -2^31 ~ 2^31

//contain을 이용하면 O(n) 의 복잡도를 가진다.

let N = Int(readLine()!)!
let Nlist = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let M = Int(readLine()!)!
let Mlist = readLine()!.split(separator: " ").map { Int($0)! }

Mlist.forEach { number in
    print(binarySearchForAscending(array: Nlist, item: number))
}

// 하도 안풀려 블로그 발췌한 이진탐색 로직,,, 외워버리자 ,,
func binarySearchForAscending<T: Comparable>(array: [T], item: T) -> Int {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]
        if guess == item {
            return 1
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return 0
}
