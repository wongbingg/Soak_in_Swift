//시험 점수를 입력받아 90 ~ 100점은 A, 80 ~ 89점은 B, 70 ~ 79점은 C, 60 ~ 69점은 D, 나머지 점수는 F를 출력하는 프로그램을 작성하시오.

import Foundation

var input = readLine().map{Int($0)!}

if let a = input {
    if a >= 90{
        print("A")
    }else if a >= 80 {
        print("B")
    }else if a >= 70 {
        print("C")
    }else if a >= 60 {
        print("D")
    }else{
        print("F")
    }
}
