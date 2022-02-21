//<4673> 셀프넘버 (1시간 40분 걸림)

func D(n:Int) -> Int {
    var result = 0
    if n < 10 {
        result = n + n
    }else if n < 100 {
        result = n + (n % 10) + (n / 10)
    }else if n < 1000 {
        result = n + (n % 10) + ((n / 10) % 10) + (n / 100)
    }else if n < 10000{
        result = n + (n % 10) + ((n / 10) % 10) + ((n / 100) % 10) + (n / 1000)
    }else {
        result = 10001
    }
    return result
}

var lst = Array<Int>(1...10000)

for i in 1...10000{
    let result = D(n:i)
    if result <= 10000{
        if let firstIndex = lst.firstIndex(of: result){
                lst.remove(at: firstIndex)
            }
    }else{
        continue
    }
}

for j in lst {
    print(j)
}




