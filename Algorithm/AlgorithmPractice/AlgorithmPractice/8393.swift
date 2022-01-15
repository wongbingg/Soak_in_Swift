//<8393> n! 구하기

import Foundation

var input = readLine().map{Int($0)!}

if let n = input {
    var result = 0
    for i in 1...n {
        result = result + i
        
    }
    print(result)
}

