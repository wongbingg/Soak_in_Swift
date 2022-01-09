// x,y 좌표값을 입력받으면 사분면을 출력하라

import Foundation

var x = readLine().map{Int($0)!}
var y = readLine().map{Int($0)!}

if let x = x, let y = y {
    if x > 0 && y > 0 {
        print(1)
    }else if x < 0 && y > 0 {
        print(2)
    }else if x < 0 && y < 0 {
        print(3)
    }else{
        print(4)
    }
}
