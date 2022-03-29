 //sum이라는 상수에 클로저 할당
let sum: (Int,Int) -> Int = { (a: Int, b: Int) in
    return a+b
}
let sumResult: Int = sum(1, 2)

//--------------------------------------------------------

let add: (Int,Int) -> Int
add = { (a:Int, b:Int) in
    return a+b
}

let sub: (Int,Int) -> Int
sub = { (a:Int, b:Int) in
    return a-b
}

//--------------------------------------------------------

func calculate(a:Int, b:Int, method: (Int,Int) -> Int ) -> Int {
    return method(a,b)
}
var calculated: Int
//---------------------------------------------------------


//함수를 호출 할 때 클로저를 작성하여 전달
calculated = calculate(a:50,b:10,method: {(left: Int,right: Int) -> Int in
    return left * right
})

//반환타입 생략
calculated = calculate(a:10,b:20,method: { (a:Int, b:Int) in
    return a+b
})

//후행 클로저: 클로저가 함수의 마지막 전달인자일 때 마지막 매개변수 이름 생략 후 함수 소괄호 외부에 클로져 구현 가능
var result = calculate(a:10,b:10){ (left: Int, right: Int) -> Int in
    return left + right
}
//반환타입 생략
result = calculate(a: 10,b: 10,method: {(left: Int, right: Int) in
    return left + right
})

//후행 클로져와 함께 사용
result = calculate(a:10, b:10){ (left: Int,right: Int) in
    return left + right
}
//단축 인자이름
result = calculate(a:10, b:10, method: {
    return $0 + $1
})
//후행클로저와 함께 사용
result = calculate(a:10, b:10){
    return $0 + $1
}
//암시적 반환표현
result = calculate(a: 10,b:10){
    $0 + $1
}
//한줄 표현 가능
result = calculate(a:10,b:10){$0 + $1}




//-----------------------------------------------------

//MARK: - 공식문서에 나온 closure 예시

let names = ["Ch","Al","Ew","Ba","Da"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames1 = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

var reversedNames2 = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2 })

//sorted함수의 Parameters타입, Return타입 추론이 가능하기 때문에 두 타입을 생략가능
var reversedNames3 = names.sorted(by: { s1, s2 in return s1 > s2 })

//single-expression closure일 경우( 리턴값이 하나일 경우?) return 생략가능
var reversedNames4 = names.sorted(by: { s1, s2 in s1 > s2})

//shorthand argument names
var reversedNames5 = names.sorted(by: { $0 > $1 } )

//operator methods
var reversedNames6 = names.sorted(by: > )
