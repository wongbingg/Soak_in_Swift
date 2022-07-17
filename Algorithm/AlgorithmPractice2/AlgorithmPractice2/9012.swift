/*
 <9012>
 VPS 형태를 판단하여 YES NO 로 출력해라.
 ValidParenthesis String, VPS) 는 (), ()(), ()(()) ..
 1. 감싼형태 가능 (), (()), ((())), (((())))
 2. 접합형태 가능 (),()(),()()(), ()()()(),
 1,2 의 결과값도 VPS 형태이므로 그 결과값을 다시 1,2에 적용해볼 수 있다.
 */
import Foundation

let T = Int(readLine()!)!
var list: [String] = []

(1...T).forEach { _ in
    let input = readLine()!
    list.append(input)
}
list.forEach { str in
    var strForm = str
    while strForm.contains("()") {
        strForm = strForm.replacingOccurrences(of: "()", with: "")
    }
    if strForm == "" {
        print("YES")
    } else {
        print("NO")
    }
}
