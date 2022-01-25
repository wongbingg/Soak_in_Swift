enum TestError : Error {
      
      case outOfRange

  }

func printNumberAndThrows(number: Int) throws -> Int {
    
    guard number <= 10 && number >= 1 else {
        throw TestError.outOfRange
    }
  
    
    return number
}

func printNumber(number: Int) -> Int {
    var newnumber: Int = 0
    do {
        newnumber = try printNumberAndThrows(number: number)
    }catch TestError.outOfRange{
        print("범위를 초과하였습니다 1~10 을 입력하시오")
    }catch {
        print("default error catch")
    }
    
    return newnumber
}

let a = printNumber(number: 11)
