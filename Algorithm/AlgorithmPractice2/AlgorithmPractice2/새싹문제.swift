// MARK: - <5597> 과제 안내신분 ?

//var list = Array(0...30)
//(1...28).forEach { _ in
//    let n = Int(readLine()!)!
//    list[n] = 0
//}
//list.removeAll { num in
//    num == 0
//}
//print(list.min()!)
//print(list.max()!)


// MARK: - <2738> 행렬 덧셈

//let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//let N = input[0]
//let M = input[1]
//var grid1: [[Int]] = []
//var grid2: [[Int]] = []
//
//(1...N).forEach { _ in
//    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
//    grid1.append(row)
//}
//(1...N).forEach { _ in
//    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
//    grid2.append(row)
//}
//var newGrid: [[Int]] = []
//for i in 0..<N {
//    var row: [Int] = []
//    for j in 0..<M {
//        let element = grid1[i][j] + grid2[i][j]
//        row.append(element)
//    }
//    newGrid.append(row)
//}
//newGrid.forEach {
//    $0.forEach { num in
//        print(num, terminator: " ")
//    }
//    print("")
//}

// MARK: - <15964> 이상한 기호

//let input = readLine()!.split(separator: " ").compactMap { Int($0) }
//let a = input[0]
//let b = input[1]
//print((a+b)*(a-b))

// MARK: - <2743> 단어 길이재기

//let input = readLine()!
//print(input.count)

// MARK: - <2744> 대소문자 바꾸기

//let input = readLine()!
//var result: String = ""
//input.forEach { char in
//    if char.isLowercase {
//        result += char.uppercased()
//    } else if char.isUppercase {
//        result += char.lowercased()
//    }
//}
//print(result)

