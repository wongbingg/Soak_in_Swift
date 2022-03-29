//<2941> 크로아티아 알파벳

let input = readLine()!

var croatiaChar:[String] = ["c=","c-","dz=","d-","lj","nj","s=","z="]
var croa_1 = "c="
var croatiaChar_Map:[Character] = croatiaChar.map{Character($0)}
var count = 0

var result = count + removeCroatiaLetter(input).count
print(result)



func removeCroatiaLetter(_ str: String) -> String {
    var testString = str
//    for cras in croatiaChar {
//        if testString.contains(cras) {
//            testString.remove(at: testString.firstIndex(of: cras)!)
//            count += 1
//        }
//    }
    testString.contains(croa_1)
    return testString
    
}
