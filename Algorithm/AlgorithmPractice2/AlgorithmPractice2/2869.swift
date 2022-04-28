//<2869> 달팽이는 올라가고 싶다
//V미터 이동시 완료, 하루(낮: A미터이동가능, 밤: B미터 복귀)
//V <= A + (A - B)x
//답: x + 1

let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
let A = input[0]
let B = input[1]
let V = input[2]

var nearDay = (V - A) / (A - B)

for i in nearDay... {
    if V <= A + ((A - B) * i) {
        print(i + 1)
        break
    }
}
