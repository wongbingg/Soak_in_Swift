// <1074> Z
// 행렬을 4등분 후 접근
//import Foundation
//
//let input = readLine()!.split(separator: " ").compactMap{ Int($0)! }
//let N = input[0]
//let r = input[1]
//let c = input[2]
//
//var path = [(Int, Int)]()
//func z(start: (Int, Int), level: Int) {
//    let right = (start.0, start.1 + level)
//    let down = (start.0 + level, start.1)
//    let end = (start.0 + level, start.1 + level)
//    if level == 1 {
//        path.append(start)
//        path.append(right)
//        path.append(down)
//        path.append(end)
//        return
//    } else {
//        z(start: start, level: level/2)
//        z(start: right, level: level/2)
//        z(start: down, level: level/2)
//        z(start: end, level: level/2)
//    }
//}
//let n = Int(truncating: NSDecimalNumber(decimal: pow(2, N-1)))
//z(start: (0, 0), level: n)
//var result = path.firstIndex { elem in
//    elem.0 == r && elem.1 == c
//}
//print(result!)

// 메모리초과,, 메모리를 줄여보자
// 해당 행렬좌표값에 근사하지 않으면 계산하지 않고 넘어가는 방법
//import Foundation
//
//let input = readLine()!.split(separator: " ").compactMap{ Int($0)! }
//let N = input[0]
//let r = input[1]
//let c = input[2]
//
//var count = 0
//var checked: Bool = false
//func z(start: (Int, Int), level: Int) {
//    guard checked == false else { return }
//    let right = (start.0, start.1 + level)
//    let down = (start.0 + level, start.1)
//    let end = (start.0 + level, start.1 + level)
//
//    if level == 1 {
//        guard checked == false else { return }
//        if start == (r,c) {
//            checked = true
//        } else if right == (r,c) {
//            count += 1
//            checked = true
//        } else if down == (r,c) {
//            count += 2
//            checked = true
//        } else if end == (r,c) {
//            count += 3
//            checked = true
//        } else {
//            count += 4
//        }
//        return
//    } else {
//        z(start: start, level: level/2)
//        z(start: right, level: level/2)
//        z(start: down, level: level/2)
//        z(start: end, level: level/2)
//    }
//}
//let n = Int(pow(2.0, Double(N-1)))
//z(start: (0, 0), level: n)
//print(count)

// 시간초과 .. ㅋㅋㅋㅋ

import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int($0)! }
let N = input[0]
var r = input[1]
var c = input[2]

var count = 0

func z(start: (Int, Int), level: Int) {
    let right = (start.0, start.1 + level)
    let down = (start.0 + level, start.1)
    let end = (start.0 + level, start.1 + level)
    if level == 1 {
        if start == (r,c) {
        } else if right == (r,c) {
            count += 1
        } else if down == (r,c) {
            count += 2
        } else if end == (r,c) {
            count += 3
        }
        return
    }
    
    if r < end.0 && c < end.1 { // 1사분면
        z(start: start, level: level/2)
    } else if r < end.0 &&  c >= end.1 { // 2사분면
        z(start: right, level: level/2)
        count += (level * level)
    } else if r >= end.0 && c < end.1 { // 3사분면
        z(start: down, level: level/2)
        count += 2 * (level * level)
    } else { // 4사분면
        z(start: end, level: level/2)
        count += 3 * (level * level)
    }
}
let n = Int(pow(2.0, Double(N-1)))
z(start: (0, 0), level: n)
print(count)

// MARK:  - 79512KB 12ms 1112B 통과
// 사분면으로 나누어 목표점이 있는 곳으로 들어가 n==1 일때 최종 계산
