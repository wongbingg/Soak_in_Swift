//<2884>알람시계 45분 일찍 맞추기

import Foundation

var input = readLine()?.split(separator: " ").map{Int($0)!}

if let a = input {
    var H = a[0]
    let M = a[1]
   
    if H == 0 && M < 45{
        H = 24
        print(H - 1,M + 15)
    }else if M >= 45{
        print(H ,M - 45)
    }else {
        print(H - 1,M + 15)
    }
    
}
