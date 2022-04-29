//<11653> 소인수분해

var N = Int(readLine()!)!
var divider = 2
var dividerHistory: [Int] = []
while N > 1 {
    if N % divider == 0{
        N /= divider
        dividerHistory.append(divider)
    } else {
        divider += 1
    }
}
for i in dividerHistory {
    print(i)
}
