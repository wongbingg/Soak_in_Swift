//<2908> 상수

let input = readLine()?.split(separator: " ").map{String($0.reversed())}.map{Int($0)!}
print(input!.max()!)

