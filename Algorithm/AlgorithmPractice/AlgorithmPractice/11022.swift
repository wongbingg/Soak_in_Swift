//<11022> A+B 

import Foundation

var input = readLine().map{Int($0)!}
var lst:[String] = []
if let T = input {
    for i in 1...T {
        var N = readLine()?.split(separator: " ").map{Int($0)!}
        if let n = N {
        lst.append("Case #\(i): \(n[0]) + \(n[1]) = \(n[0] + n[1])")
        }
    }
    for j in lst{
        print(j)
    }
}
