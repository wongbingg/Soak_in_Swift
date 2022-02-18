
//<2562> 최댓값 구하기

import Foundation

var lst:[Int] = []

for _ in 1...9 {
    if let N = readLine().map{Int($0)!} {
        lst.append(N)
    }
}

let maxNumber = lst.max()!
let maxNumberIndex = lst.firstIndex(of: maxNumber)!

print(maxNumber)
print(maxNumberIndex + 1)

