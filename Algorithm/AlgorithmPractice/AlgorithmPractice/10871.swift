//<10871> x 보다 작은 수

import Foundation

var NX = (readLine()?.split(separator: " ").map{Int($0)!})!

var A = readLine()?.split(separator: " ").map{Int($0)!}

var lst:[Int] = []

for i in A! {
    if i < NX[1] {
        lst.append(i)
    }
}

for j in lst {
    print(j,terminator: " ")
}




