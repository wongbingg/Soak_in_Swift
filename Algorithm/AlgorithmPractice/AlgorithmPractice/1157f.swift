//<1157> 단어 공부 104100 KB  1104 ms 시간이랑 용량이 너무 많이 잡힘..

var input = readLine()

if let s = input {
    let S = s.uppercased() //대문자로 변경
    let S_Character_List = Set(S).sorted() // 중복제거 후 정렬
    var S_Character_Number:[Int] = [] // 각 알파벳 별 반복횟수 저장
    
    for i in S_Character_List  {
        var count = 0
        for j in S {
            if i == j {
                count += 1
            }
        }
        S_Character_Number.append(count)
    }

    let maxValue = S_Character_Number.max() // 가장 자주 나타난 알파벳의 반복횟수
    let maxIndex = S_Character_Number.firstIndex(of: maxValue!) //그 반복횟수의 배열 내 인덱스값
    let result = S_Character_List[maxIndex!]
    
    S_Character_Number.remove(at: maxIndex!) // maxValue가 여러개일 경우를 추려낼 방법으로, maxIndex의 값 하나를 지운다
    
    if S_Character_Number.contains(maxValue!){ // max값이 남아있으면 중복된 경우였으므로 ?를 출력
        print("?")
    }else { // max값이 안남아 있으면 유일한 max값 이었으므로 result 출력
        print(result)
    }
}
