//두 수를 입력받고 그 크기를 비교하시오.

import Foundation

var input = readLine()

if let input = input {
    let inputs = input.components(separatedBy: " ").map{Int($0)!}
    if inputs[0] > inputs[1] {
        print(">")
    }else if inputs[0] < inputs[1] {
        print("<")
    }else {
        print("==")
    }
        
}
