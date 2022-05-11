//<2798> 블랙잭
// 세 장의 카드를 고르는 모든 경우를 고려하는 문제
// N장의 카드에서 3개만 골랐을 때 그 합이 M과 가장 가까워야 한다.
// N이 100 이면 100C3 = 100P3 / 3! = 161700번의 경우의 수가 나온다.. 이걸 다 해봐야 하나?!

let input = readLine()?.split(separator: " ").map{ Int($0)!} ?? [0]
let lineUpCard = readLine()?.split(separator: " ").map{ Int($0)!}.sorted() ?? [0]

let N = input[0]
let M = input[1]

var resultList: [Int] = []
var lessDifferValue = 100000
var resultNumber = 0
for i in lineUpCard {
    for j in lineUpCard {
        guard j > i else { continue }
        
        for k in lineUpCard {
            guard k > j ,i + j + k <= M else { continue }
            resultList.append(i + j + k)
            
        }
    }
}
print(resultList.max()!)

