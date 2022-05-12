//<2920> 음계
// 주어진 숫자의 배열이 오름차순이면 ascending 내림차순이면 descending 섞여있으면 mixed 를 출력하라
let input = readLine()?.split(separator: " ").map{ Int($0)! } ?? [0]
if input == input.sorted() {
    print("ascending")
} else if input == input.sorted().reversed() {
    print("descending")
} else {
    print("mixed")
}
