// <10773> 제로

let N = Int(readLine()!)!
var list = [Int]()
(1...N).forEach { _ in
    let input = Int(readLine()!)!
    if input == 0 && list.isEmpty == false {
        list.popLast()
    } else {
        list.append(input)
    }
}
print(list.reduce(0, +))
