
//<3052> 나머지
var lst:[Int] = []
(0..<10).forEach { _ in
    let N = Int(readLine()!)!
    let result = N % 42
    lst.append(result)
}
let lstToSet = Set(lst)
print(lstToSet.count)


