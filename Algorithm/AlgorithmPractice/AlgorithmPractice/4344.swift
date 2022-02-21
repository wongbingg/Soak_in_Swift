
//<4344> 평균은 넘겠지

import Foundation

let C = Int(readLine()!)!
var percentOfOverAvg:[Double] = []

(0..<C).forEach { _ in
    
    var totalPoint = 0
    let N = (readLine()?.split(separator: " ").map{Int($0)!})!
    
    (1...N[0]).forEach { i in
        totalPoint += N[i]
    }
    
    let avg = totalPoint / N[0]
    var winnerCount = 0
    
    (1...N[0]).forEach { i in
        if N[i] > avg {
            winnerCount += 1
        }
    }
    
    let result = (Double(winnerCount) / Double(N[0])) * 100
    let digit: Double = pow(10,3)
    percentOfOverAvg.append(round(result * digit) / digit)
}

for i in percentOfOverAvg{
    print(String(format: "%.3f", i) + "%")
}

