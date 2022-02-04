//<11022> A+B - 8

import Foundation

var T = readLine().map{Int($0)!}!
var lst:[String] = []

for i in 1...T {
    var input = readLine()?.split(separator: " ").map{Int($0)!}
    if let n = input {
        var result = "Case #\(i): \(n[0]) + \(n[1]) = \(n[0] + n[1])"
        lst.append(result)
    }
}
for j in lst {
        print(j)
    }
