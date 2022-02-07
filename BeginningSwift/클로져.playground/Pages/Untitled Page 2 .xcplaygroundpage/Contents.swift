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




