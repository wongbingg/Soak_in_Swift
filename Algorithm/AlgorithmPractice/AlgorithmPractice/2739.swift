//<2739>구구단만들기
import Foundation

var input = readLine().map{Int($0)!}

if let N = input {
    for i in 1...9 {
        print("\(N) * \(i) = \(N * i)")
    }
}
