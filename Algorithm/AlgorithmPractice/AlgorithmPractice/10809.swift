//<10809> 알파벳 찾기 fail and search
import Foundation

var S = readLine()!
var alphabet = "abcdefghijklmnopqrstuvwxyz"
var idxList:[Int] = []
for i in alphabet {
    if let rangeI = S.range(of: "\(i)") {
        let idx = S.distance(from: S.startIndex, to: rangeI.lowerBound)
        idxList.append(idx)
    }else {
        idxList.append(-1)
    }
}

for i in idxList {
    print(i,terminator: " ")
}


