
//<1546> 평균

let N = Int(readLine()!)!
var lst:[Double] = []
if let examPoint = readLine()?.split(separator: " ").map{Double($0)!} {
    let M = examPoint.max()!
    for i in 0..<N {
        let newPoint = (examPoint[i] / M) * 100
        lst.append(newPoint)
    }
}
var totalPointOfNew = 0.0
for newNumber in lst {
    totalPointOfNew += newNumber
}
let NewAverage = totalPointOfNew / Double(N)
print(NewAverage)
