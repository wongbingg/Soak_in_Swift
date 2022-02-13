//<10951> A+B - 4  A,B 입력받은 후 A+B 를 출력하라 while 사용

import Foundation

var lst:[Int] = []

while let input = readLine() {
    
    var N = input.components(separatedBy: " ").map{Int($0)!}
    var result = N[0] + N[1]
    lst.append(result)
}

for i in lst {
    print(i)
}

//MARK: EOF 개념을 활용,, 입력이 끝나면 Ctrl + D 를 눌러 입력종료를 선언해주어야한다
//while let line = readLine(){print(line)}

