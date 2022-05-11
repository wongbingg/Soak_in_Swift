// <2480> 주사위 세개

let input = readLine()?.split(separator: " ").map{ Int($0)!} ?? [0]

if Set(input).count == 1 {
    print(10000 + (input[0] * 1000))
} else if Set(input).count == 3 {
    print(input.max()! * 100)
} else {
    print(1000 + (100 * findDuplicateNumber(list: input)))
}
          
func findDuplicateNumber(list: [Int]) -> Int {
    if list[0] == list[1] {
        return list[0]
    } else {
        return list[2]
    }
}
