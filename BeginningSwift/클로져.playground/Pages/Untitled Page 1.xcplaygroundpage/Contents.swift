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


calculated = calculate(a:30,b:10,method: add)
calculated = calculate(a:30,b:10,method: sub)
