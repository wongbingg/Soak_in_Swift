// <4949> 균형잡힌 세상
// 입력 종료조건으로 마지막에 마침표가 들어온다.

func checkValid(_ str: String) -> Bool {
    var parenthesis = [Character]()
    for char in str {
        switch char {
        case "(":
            parenthesis.append(char)
        case "[":
            parenthesis.append(char)
        case ")":
            if parenthesis.last == "(" {
                parenthesis.popLast()
            } else {
                return false
            }
        case "]":
            if parenthesis.last == "[" {
                parenthesis.popLast()
            } else {
                return false
            }
        default:
            continue
        }
    }
    if parenthesis.isEmpty {
        return true
    } else {
        return false
    }
}

var result = [String]()
while let input = readLine() {
    guard input != "." else { break }
    if checkValid(input) {
        result.append("yes")
    } else {
        result.append("no")
    }
}
result.forEach { print($0) }
// 열림 괄호가 스택처럼 쌓인다.
// FILO, 가장 위에 쌓여있는 요소부터 차례로 제거해서 결국 모두 제거되어야 yes
