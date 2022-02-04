//<10952> A + B - 5

import Foundation

var lst:[Int] = []

while true {
    var input = (readLine()?.split(separator: " ").map{Int($0)!})!
    if input[0] == 0 && input[1] == 0 {
            break
        }
   
    var result = input[0] + input[1]
    lst.append(result)
    
}

for i in lst {
    print(i)
}
