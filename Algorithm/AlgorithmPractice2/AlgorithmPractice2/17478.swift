//<17478> 재귀함수가 뭔가요?

let input = Int(readLine()!)!
var count = 0
var text1 = "\"재귀함수가 뭔가요?\""
var text2 = "\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."
var text3 = "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."
var text4 = "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\""
var answer = "\"재귀함수는 자기 자신을 호출하는 함수라네\""
var answer2 = "라고 답변하였지."
var isFinish: Bool = false

func circur(_ num: Int) {
    
    if isFinish {
        if count < 0 {
            return
        } else {
            print(String(repeating: "____", count: count) + answer2)
            count -= 1
            circur(num)
        }
        return
    }
    if count == num {
        print(String(repeating: "____", count: count) + text1)
        print(String(repeating: "____", count: count) + answer)
        isFinish = true
        circur(num)
    } else {
        print(String(repeating: "____", count: count) + text1)
        print(String(repeating: "____", count: count) + text2)
        print(String(repeating: "____", count: count) + text3)
        print(String(repeating: "____", count: count) + text4)
        count += 1
        circur(num)
    }
}
print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")

circur(input)