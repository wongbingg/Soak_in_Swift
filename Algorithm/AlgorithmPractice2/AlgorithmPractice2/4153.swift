// <4153> 직각삼각형

var result: [String] = []

while true {
    var input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
    guard Set(input) != [0] else { break }
    let maxNumber = input.max()
    input.remove(at: input.firstIndex(of: maxNumber!)!)
    if maxNumber! * maxNumber! == (input[0] * input[0]) + (input[1] * input[1]) {
        result.append("right")
    } else {
        result.append("wrong")
    }
}
result.forEach { str in
    print(str)
}
