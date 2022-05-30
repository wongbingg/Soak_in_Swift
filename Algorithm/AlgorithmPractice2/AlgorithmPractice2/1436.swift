//<1436> 영화감독 숌
// 종말의 숫자 : 어떤 수에 6이 적어도 3개이상 연속으로 들어가는 수
// 제일 작은 종말숫자 666, 그다음은 1666, 2666, 3666...
// N번째 영화의 제목에 들어간 숫자를 출력하라
// 첫째줄에 숫자 N이 들어온다 (1 <= N <= 10,000)
// 브루트포스 알고리즘 = 무차별 대입 검색, 솔루션에 대한 모든 가능한 경우를 테스트



//종말의 숫자 순서
//Normal: 666,1666,2666,3666,4666,5666,
//6Point: 6660,6661,6662,6663,6664,6665,6666,6667,6668,6669,<10개>
//Normal: 7666,8666,9666,

//Normal: 10666,11666,12666,13666,14666,15666,
//6Point: 16660,16661,16662,16663,16664,16665,16666,16667,16668,16669,
//Normal: 17666,18666,19666,

//Normal: 20666,21666,22666,23666,24666,25666,
//6Point: 26660,26661,26662,26663,26664,26665,26666,26667,26668,26669,
//Normal: 27666,28666,29666,

/// 5만 대까지 같은 수열

//Normal: 60666,61666,62666,63666,64666,65666,
//6Point: 66600 ~ 66699 <100개>
//Normal: 67666,68666,69666

//Normal: 70666,71666,72666,73666,74666,75666,
//6Point: 76660,76661,76662,,76669
//Normal: 77666,78666,79666,

//Normal: 100666,101666,102666,103666,104666,105666,
//6Point: 106660,106661,,106669,
//Normal: 107666,108666,109666,

//Normal: 110666,111666,112666,113666,114666,115666,
//6Point: 116660,,116669,
//Normal: 117666,118666,119666,

//Normal: 660666,661666,662666,663666,664666,665666,
//6Point: 666000 ~ 666999 <1000개>
//Normal: 667666,668666,669666



// 19개 씩의 덩어리로 나뉜다. 첫번째 덩어리에서 각 요소에 + 10000을 하면 다음 덩어리가 된다

//let repeatedList = [666,1666,2666,3666,4666,5666,
//                    6660,6661,6662,6663,6664,6665,6666,6667,6668,6669,
//                    7666,8666,9666]
//let N = Int(readLine()!)!
//var dong: Int {
//    if (N / 19) != 1 {
//        return N / 19
//    } else {
//        return (N / 19) - 1
//    }
//}
//var dongIndex = (N % 19) - 1
//
//var listOfThatDong = repeatedList.map { $0 + (10000 * dong) }
//print(listOfThatDong[dongIndex])




func isThreeSix(_ str : String) -> Bool {
    var str = str
    guard let firstIndex = str.firstIndex(of: "6") else { return false }
    guard firstIndex != str.index(str.endIndex, offsetBy: -2) &&
            firstIndex != str.index(str.endIndex, offsetBy: -1) else { return false }
    let secondIndex = str.index(firstIndex, offsetBy: 1)
    let thirdIndex = str.index(firstIndex, offsetBy: 2)
    let list = [str[firstIndex], str[secondIndex], str[thirdIndex]]
    if list != ["6","6","6"] {
        str.remove(at: firstIndex)
        return isThreeSix(str)
    } else {
        return true
    }
}

let N = Int(readLine()!)!
var count = 0
for i in 666... {
    if isThreeSix(String(i)) {
        count += 1
        if count == N {
            print(i )
            break
        }
    }
}


// 다른 정답자 코드 확인 결과 =/ 10 을 하며 자리수를 줄여가며 666이 있나 검사하는 방식을 이용 ..
// 24ms 가 나온 정답.. 문자열 검사가 아닌 정수열 그대로 검사하는 로직을 사용
// 자리수를 낮춰가며 검사할 수 있다는 사실을 인지하지 못했다
// 나는 왜 문자열로 밖에 생각을 못했을까 ! 정수열 검사에 익숙 해지자..

//let N = Int(readLine()!)!
//
//func isThreeSix(_ input: Int) -> Bool {
//    var inputInt = input
//    while inputInt >= 666 {
//
//        if inputInt % 1000 == 666 {
//            return true
//        } else {
//            inputInt /= 10
//        }
//    }
//    return false
//}
//
//var count = 0
//
//for i in 666... {
//    if isThreeSix(i) {
//        count += 1
//        if count == N {
//            print(i)
//        }
//    }
//}

