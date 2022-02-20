
//<8958> ox 퀴즈

var T = Int(readLine()!)!
var resultPoint:[Int] = []
(0..<T).forEach { _ in
    var pointList:[Int] = []
    var point = 0
    let N = readLine()!
    for i in N {
        if i == "O" {
            point += 1
            pointList.append(point)
        }else{
            point = 0
            pointList.append(point)
        }
    }
    let result = Sum(pointList)
    resultPoint.append(result)
    
}

func Sum(_ list:[Int]) -> Int {
    var total = 0
    for j in list {
        total += j
    }
    
    return total
}

for k in resultPoint {
    print(k)
}
