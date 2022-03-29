
//<2675> 문자열 반복

var testCase = readLine().map{Int($0)!}
if let T = testCase {
    var list:[String] = []
    for _ in 1...T {
        let RnS = (readLine()?.split(separator: " "))!
        let R = Int(RnS[0])!
        let S = String(RnS[1])
        var result:String = ""
        for i in S {
            let tripleCharacter = String(repeating: i, count: R)
            result += tripleCharacter
        }
        
        list.append(result)
    }
    for i in list {
        print(i)
    }
}

