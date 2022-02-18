
//<2577> 숫자의 개수. 79512KB 12ms 785B

import Foundation

var lst:[Int] = []
for _ in 1...3 {
    let N = Int(readLine()!)!
    lst.append(N)
}

let result = lst[0] * lst[1] * lst[2]

var resultString = String(result)

//0~9 까지의 갯수를 담을 변수 생성
var t0 = 0
var t1 = 0
var t2 = 0
var t3 = 0
var t4 = 0
var t5 = 0
var t6 = 0
var t7 = 0
var t8 = 0
var t9 = 0

//각 변수에 숫자 업데이트
for i in resultString {
    switch i {
    case "0":
        t0 += 1
    case "1":
        t1 += 1
    case "2":
        t2 += 1
    case "3":
        t3 += 1
    case "4":
        t4 += 1
    case "5":
        t5 += 1
    case "6":
        t6 += 1
    case "7":
        t7 += 1
    case "8":
        t8 += 1
    case "9":
        t9 += 1
    default:
        print("default message")
    }
}

//각 변수 출력
print(t0)
print(t1)
print(t2)
print(t3)
print(t4)
print(t5)
print(t6)
print(t7)
print(t8)
print(t9)
