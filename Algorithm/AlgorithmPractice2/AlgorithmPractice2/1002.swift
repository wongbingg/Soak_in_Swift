// <1002> 터렛
import Foundation

let T = Int(readLine()!)!
var result: [Int] = []
(1...T).forEach { _ in
    let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
    let x = input[0] - input[3]
    let y = input[1] - input[4]
    let r1 = Double(input[2])
    let r2 = Double(input[5])
    let distance = sqrt(Double(x * x) + Double(y * y))
    if distance == 0 && r1 == r2 {
        result.append(-1)
    } else if distance == 0 && r1 != r2 {
        result.append(0)
    } else if distance > r1 + r2 {
        result.append(0)
    } else if distance + min(r1, r2) < max(r1, r2){
        result.append(0)
    } else if distance + min(r1, r2) == max(r1, r2){
        result.append(1)
    } else if distance == r1 + r2 {
        result.append(1)
    } else {
        result.append(2)
    }
}
result.forEach { i in
    print(i)
}
