//index를 활용한 문자열 슬라이싱?

let greeting = "Hello, World!"

let index = greeting.index(of: ",") ?? greeting.endIndex

let beginning = greeting[..<index]

let newString = String(beginning)

print(newString)
