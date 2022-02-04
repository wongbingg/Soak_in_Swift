//<2438> 별찍기

import Foundation

var N = readLine().map{Int($0)!}


if let number = N {
    for i in 1...number {
        let str = String(repeating: "*", count: i)
        print(str)
    }
}

