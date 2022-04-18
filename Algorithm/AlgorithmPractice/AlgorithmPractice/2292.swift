//<2292> 벌집

// 1 = 1방, 2~7 = 2방, 8~19 = 3방, 20~37 = 4방, 38~61 = 5방 ...
// 1,6,12,18,24,...
// 입력값이 어느 방에 해당하는지 검증 후 출력
// 방 안의 숫자는 첫번째 빼고 6의 배수씩 늘어남

let inputNumber = Int(readLine()!)!
var lastNumberInGroup: Int = 1
var group: Int = 1
for i in 1... {
  
    lastNumberInGroup += 6 * (i - 1)
    if inputNumber > lastNumberInGroup {
        group += 1
    } else {
        print(group )
        break
    }
}








