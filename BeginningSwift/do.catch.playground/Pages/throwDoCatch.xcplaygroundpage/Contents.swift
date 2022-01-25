// enum형으로 error타입명 정의
enum DataError : Error { // Error 프로토콜을 구현한 것은 오류 타입으로 사용하라는 일종의 가독성 표시
    case overSizeYear
    case incorrectData(part: Int)
}

// 오류가 나는 조건을 throws와 함께 배치
func getNextYearAndThrows(paramYear: Int) throws -> Int {
    guard paramYear <= 2020 else {
        throw DataError.overSizeYear
    }
    
    guard paramYear >= 0 else {
        throw DataError.incorrectData(part: paramYear)
    }
    
    return paramYear+1
}

// 실제로 응용프로그램에서 불러올 함수
func getNextYear(paramYear: Int) -> Int {
    var year: Int = 0
    do {
        year = try getNextYearAndThrows(paramYear: paramYear)
    } catch DataError.overSizeYear {
        print("년도 초과해서 입력하였습니다")
    } catch DataError.incorrectData(let part){
        print("입력한 값이 \(part)이므로 오류입니다.")
    } catch {
        print("default error catch")
    }
    
    return year
}

let a = getNextYear(paramYear: 0) // 입력한 값이 -999이므로 오류입니다.
