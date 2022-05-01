//<1085> 직사각형에서 탈출

let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]

let x = Double(input[0])
let y = Double(input[1])
let w = Double(input[2])
let h = Double(input[3])

func mindecider(a:Double, b:Double) -> Int {
    if a > b / 2 {
        return Int(b - a)
    } else {
        return Int(a)
    }
}

print(min(mindecider(a: x, b: w), mindecider(a: y, b: h)))
