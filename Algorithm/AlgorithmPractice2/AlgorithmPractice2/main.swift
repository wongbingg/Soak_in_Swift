// <15829> Hashing
// 마치 31진수를 나타내는 과정 같다.
// abcde 의 해시값은 1xpow(31,0) + 2xpow(31,1) + 3xpow(31,2) + 4xpow(31,3)
//예제 1: abcde의 해시 값은 1 × 310 + 2 × 311 + 3 × 312 + 4 × 313 + 5 × 314 = 1 + 62 + 2883 + 119164 + 4617605 = 4739715이다.
//예제 2: zzz의 해시 값은 26 × 310 + 26 × 311 + 26 × 312 = 26 + 806 + 24986 = 25818이다.
//import Foundation
//
let mod = 1234567891
var L = readLine()
let englishInput = Array(readLine()!).map{ Int($0.asciiValue! - 96) }
var result = 0
var m = 1
for i in englishInput {
    result = (result + (i * m)) % mod
    m = (m * 31) % mod
}
print(result)

// 위 코드는 구글링 후 블로그 코드


//let mod = 1234567891
//readLine()
//let input = Array(readLine()!).map{Int(exactly: $0.asciiValue!)! - 96}
//var hash = 0
//var m = 1
//for i in input{
//    hash = (hash + i*m) % mod
//    m = (m*31) % mod
//}
//print(hash)
