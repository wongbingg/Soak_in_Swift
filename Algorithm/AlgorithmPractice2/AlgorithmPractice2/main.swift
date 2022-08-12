// <15829> Hashing
// 마치 31진수를 나타내는 과정 같다.
// abcde 의 해시값은 1xpow(31,0) + 2xpow(31,1) + 3xpow(31,2) + 4xpow(31,3)
//예제 1: abcde의 해시 값은 1 × 310 + 2 × 311 + 3 × 312 + 4 × 313 + 5 × 314 = 1 + 62 + 2883 + 119164 + 4617605 = 4739715이다.
//예제 2: zzz의 해시 값은 26 × 310 + 26 × 311 + 26 × 312 = 26 + 806 + 24986 = 25818이다.
//import Foundation
//
//let mod = 1234567891
//var L = readLine()
//let englishInput = Array(readLine()!).map{ Int($0.asciiValue! - 96) }
//var result = 0
//var m = 1
//for i in englishInput {
//    result = (result + (i * m)) % mod
//    m = (m * 31) % mod
//}
//print(result)

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
//enum HashEnglish: Int {
//    case a = 1
//    case b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
//}

let M = 1234567891
let L = Int(readLine()!)!
let englishStr = readLine()!

func power(num: Int, time: Int) -> Int {
    guard time > 0 else { return 1 }
    var result = 1
    for _ in 1...time {
        if result > M {
            result = result % M
        }
        result *= num
    }
    return result
}

func makeHash(_ str: String) -> Int {
    var repeatNumber = 0
    var result = 0
    str.forEach { char in
        switch char {
        case "a":
            result += 1 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "b":
            result += 2 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "c":
            result += 3 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "d":
            result += 4 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "e":
            result += 5 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "f":
            result += 6 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "g":
            result += 7 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "h":
            result += 8 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "i":
            result += 9 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "j":
            result += 10 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "k":
            result += 11 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "l":
            result += 12 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "m":
            result += 13 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "n":
            result += 14 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "o":
            result += 15 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "p":
            result += 16 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "q":
            result += 17 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "r":
            result += 18 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "s":
            result += 19 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "t":
            result += 20 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "u":
            result += 21 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "v":
            result += 22 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "w":
            result += 23 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "x":
            result += 24 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "y":
            result += 25 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        case "z":
            result += 26 * power(num: 31, time: repeatNumber)
            repeatNumber += 1
        default:
            return
        }
    }
    return result % M
}

print(makeHash(englishStr))

// M 으로 mod 를 중간중간 계속 해주어서 Int 범위에 overFlow 되지 않도록 만들어 주어야 더 넓은 범위로 계산 가능
