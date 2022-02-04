//<2439> 별찍기 2

import Foundation

var N = readLine().map{Int($0)!}!

for i in 1...N {
    let str = String(repeating: "*", count: i)
    let spc = String(repeating: " ", count: N - i)
    print(spc + str)
}

