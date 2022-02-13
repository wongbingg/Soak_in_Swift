//<1110> 더하기 사이클

import Foundation

var count = 0
let input = (readLine().map{Int($0)!})!
var N = input //input 값을 변하지 않게 하기위해 N으로 복사해옴

while true {
    let left = N / 10
    let right = N % 10
    let result = left + right
    count += 1
    if input != (right * 10) + (result % 10) { // 처음 입력받았던 N 값이 자꾸 변하니까 무한루프 돌았다..
        N = (right * 10) + (result % 10)
    }else {
        break
    }
}
print(count)





