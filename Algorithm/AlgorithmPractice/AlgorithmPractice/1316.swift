//<1316> 그룹 단어 체커

var input = readLine().map{Int($0)!}
var inputList: [String] = []
var countGroupWord: Int = 0
if let N = input {
    for _ in 1...N {
        let word = readLine()!
        inputList.append(word)
    }
}

for word in inputList {
    if checkGroupWord(word) {
        countGroupWord += 1
    }
}
print(countGroupWord)

func checkGroupWord(_ string: String) -> Bool {
    let charList = Set(string)
    var result:[Int] = []
    for char in charList {
        let first = string.firstIndex(of: char)!
        let last = string.lastIndex(of: char)!
        let serialchar = string[first...last]
        
        if Set(serialchar).count > 1 {
            result.append(1)
        } else {
            result.append(0)
        }
    }
    
    if result.contains(1) {
        return false
    } else {
        return true
    }
}
