// <17219> 비밀번호 찾기

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let M = input[1]
var keychain = [String: String]()
(1...N).forEach { _ in
    let sitePassword = readLine()!.split(separator: " ").map{String($0)}
    keychain[sitePassword[0]] = sitePassword[1]
}
var result = [String]()
(1...M).forEach { _ in
    let site = readLine()!
    result.append(keychain[site]!)
}
print(result.joined(separator: "\n"))
