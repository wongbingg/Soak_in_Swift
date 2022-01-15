//<10950> 테스트케이스 개수 T
import Foundation

var T = readLine().map{Int($0)!}

if let T = T {
    var lst:[Int] = []
    for _ in 1...T{
        if let N = readLine()?.split(separator: " ").map({Int($0)!}){
            let result = N[0] + N[1]
            lst.append(result)
        }
        
    }
    for i in lst{
        print(i)
}
}
