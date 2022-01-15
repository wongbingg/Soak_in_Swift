//<11021> A + B
import Foundation
var T = readLine().map{Int($0)!}!
var lst:[String] = []
for i in 1...T{
    let input = readLine()?.split(separator:" ").map{Int($0)!}
    if let n = input {
        lst.append("Case #\(i): \(n[0] + n[1])")
    }
}
for j in lst {
    print(j)
}
