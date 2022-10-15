// <10807> 개수 세기

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = Int(readLine()!)!

print(numbers.filter { $0 == v }.count)
