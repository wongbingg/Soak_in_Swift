// <15829> Hashing
// 마치 31진수를 나타내는 과정 같다.
// abcde 의 해시값은 1xpow(31,0) + 2xpow(31,1) + 3xpow(31,2) + 4xpow(31,3)
//예제 1: abcde의 해시 값은 1 × 310 + 2 × 311 + 3 × 312 + 4 × 313 + 5 × 314 = 1 + 62 + 2883 + 119164 + 4617605 = 4739715이다.
//예제 2: zzz의 해시 값은 26 × 310 + 26 × 311 + 26 × 312 = 26 + 806 + 24986 = 25818이다.
import Foundation
let dic: [String: Int] = ["a":1,"b":2,"c":3,"d":4,"e":5,"f":6,"g":7,"h":8,"i":9,"j":10,"k":11,"l":12,"m":13,"n":14,"o":15,"p":16,"q":17,"r":18,"s":19,"t":20,"u":21,"v":22,"w":23,"x":24,"y":25,"z":26]
var L = Int(readLine()!)!
let englishInput = readLine()!
var result = 0
for i in 0...(L - 1) {
    result += dic[String(str)]!
}
print(result % 1234567891)

//NSDecimalNumber(decimal: pow(31,L - 1)).intValue
//dic[String(str)]!
