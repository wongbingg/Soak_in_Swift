//연도가 주어졌을 때 윤년이면 1, 아니면 0 출력

import Foundation

var input = readLine().map{Int($0)!}

if let a = input {
    if a % 400 == 0 {
        print(1)
    }else if a % 4 == 0 && a % 100 != 0 {
        print(1)
    }else{
        print(0)
    }
}
