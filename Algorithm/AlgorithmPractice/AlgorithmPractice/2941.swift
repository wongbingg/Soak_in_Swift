//<2941> 크로아티아 알파벳

//크로아티아 문자를 인식하고 1로 치환을 해준다
//남은 문자는 .count 를 이용해 갯수를 세어준 후 cnt랑 합쳐준다

import Foundation

let input = readLine()!
var testInput = input
var croatiaLetterList = ["c=","c-","dz=","d-","lj","nj","s=","z="]
for i in croatiaLetterList {
    if testInput.contains(i){
        testInput = testInput.replacingOccurrences(of: i, with: "1")
    }
}
print(testInput.count)

