// <12813> 이진수 연산
// BitMask 연습을 위한 문제

let A = readLine()!
let B = readLine()!

func andOpt(lhs: String, rhs: String) -> String {
    var result = ""
    for i in 0..<lhs.count {
        if lhs[lhs.index(lhs.startIndex, offsetBy: i)] == "1" &&
            rhs[rhs.index(rhs.startIndex, offsetBy: i)] == "1" {
            result += "1"
        } else {
            result += "0"
        }
    }
    return result
}

func orOpt(lhs: String, rhs: String) -> String {
    var result = ""
    for i in 0..<lhs.count {
        if lhs[lhs.index(lhs.startIndex, offsetBy: i)] == "1" || rhs[rhs.index(rhs.startIndex, offsetBy: i)] == "1"  {
            result += "1"
        } else {
            result += "0"
        }
    }
    return result
}

func xorOpt(lhs: String, rhs: String) -> String {
    var result = ""
    for i in 0..<lhs.count {
        if lhs[lhs.index(lhs.startIndex, offsetBy: i)] != rhs[rhs.index(rhs.startIndex, offsetBy: i)] {
            result += "1"
        } else {
            result += "0"
        }
    }
    return result
}

func notOpt(str: String) -> String {
    var result = ""
    for i in 0..<str.count {
        if str[str.index(str.startIndex, offsetBy: i)] == "1" {
            result += "0"
        } else {
            result += "1"
        }
    }
    return result
}

print(andOpt(lhs: A, rhs: B))
print(orOpt(lhs: A, rhs: B))
print(xorOpt(lhs: A, rhs: B))
print(notOpt(str: A))
print(notOpt(str: B))



