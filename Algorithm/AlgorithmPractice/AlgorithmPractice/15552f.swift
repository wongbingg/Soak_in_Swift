//<15552> 빠른 A + B
//시간초과...

import Foundation

var T = readLine().map{Int($0)!}

if let T = T {
    var lst:[Int]=[]
    for _ in 1...T {
        let input = readLine()?.split(separator: " ").map{Int($0)!}
        if let n = input {
            lst.append(n[0] + n[1])
        }
    }
    for i in lst{
        print(i)
    }
}

