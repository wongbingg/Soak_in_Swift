//<2609> 최대공약수와 최소공배수
// 두 개의 자연수를 입력받아 최대 공약수와 최소 공배수를 출력하는 프로그램을 작성
// 10,000 이하의 자연수
// 유클리드 호제법
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var n = input
var maxGongyaksu: Int = 0
var minGongbaesu: Int = 0
var cnt = 0
while true {
    cnt += 1
    n = n.sorted()
    let result = n[1] % n[0]
    if cnt == 1 {
        if result == 0 {
            maxGongyaksu = n[0]
            minGongbaesu = n[1]
            break
        }
    }
    if result == 0 {
        maxGongyaksu = n[0]
        break
    } else {
        n[1] = result
    }
}

var a = input.max()! / maxGongyaksu
minGongbaesu = a * input.min()!
print(maxGongyaksu)
print(minGongbaesu)

