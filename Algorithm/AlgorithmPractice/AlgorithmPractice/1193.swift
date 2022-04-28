//<1193> 분수찾기
// 분자수열 1,(1,2),(3,2,1),(1,2,3,4),(5,4,3,2,1),(1,2,3,4,5,6),(7,6,5,4,3,2,1)....
// 분모수열 1,(2,1),(1,2,3),(4,3,2,1),(1,2,3,4,5),(6,5,4,3,2,1)...
// inputNumber 값을 기준으로 for문을 몇번 돌려야 하는지 지정해준 후 값 찾기


var inputNumber = Int(readLine()!)!
var numberOfGroup = 0
var groupElementCount = 0
var list = [Int]()


for elementCount in 1... {
    numberOfGroup += 1
    groupElementCount += elementCount
    if groupElementCount >= inputNumber {
        groupElementCount -= elementCount
        inputNumber -= groupElementCount
        break
    }
}

for i in 1...numberOfGroup {
    
    list.append(i)
}

if numberOfGroup % 2 == 0 {
    print("\(list[inputNumber - 1])/\(list.reversed()[inputNumber - 1])")
} else {
    print("\(list.reversed()[inputNumber - 1])/\(list[inputNumber - 1])")
}


