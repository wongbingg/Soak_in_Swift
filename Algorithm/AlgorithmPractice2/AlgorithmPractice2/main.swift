// <1259> 팰린드롬수
// 단어를 뒤에서 부터 읽어도 똑같은 단어를 팰린드롬 이라고 한다 'radar', 'sees'
// 팰린드롬을 수에 적용하자 121 12321 등
var input: String = ""
var list: [String] = []
while true {
    input = readLine()!
    guard input != "0" else { break }
    var strList: [Character] = []
    input.forEach { char in
        strList.append(char)
    }
    for i in strList.indices {
        if i == (strList.count / 2) {
            list.append("yes")
            break
        }
        if strList[i] == strList[strList.count - 1 - i] {
            continue
        } else {
            list.append("no")
            break
        }
    }
}
list.forEach{ print($0)}
