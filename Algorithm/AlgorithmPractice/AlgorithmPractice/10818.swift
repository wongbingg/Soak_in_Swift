//<10818> 최대최소값 구하기

import Foundation

var T = readLine()
var N = readLine()?.split(separator: " ").map{Int($0)!}

print(FindMin(N!),FindMax(N!))

func FindMax(_ lst:[Int]) -> Int {
    var maxNumber = lst[0]
    for i in lst {
        if i > maxNumber {
            maxNumber = i
        }else{
            continue
        }
    }
    return maxNumber
}

func FindMin(_ lst:[Int]) -> Int {
    var minNumber = lst[0]
    for i in lst {
        if i < minNumber {
            minNumber = i
        }else {
            continue
        }
    }
    return minNumber
}
