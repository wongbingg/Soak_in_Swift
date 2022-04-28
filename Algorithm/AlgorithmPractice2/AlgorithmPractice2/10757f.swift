// <10757> 큰수 A + B

let input = readLine()?.split(separator: " ") ?? [""]

var leftNumber = String(input[0])
var rightNumber = String(input[1])
var resultString = ""
var leftPiece: Substring
var rightPiece: Substring
var isOver: Bool = false

while leftNumber.count > 0 || rightNumber.count > 0 {
    
    let minOfTwoNumberCount = min(leftNumber.count, rightNumber.count)
    
    if minOfTwoNumberCount == 0 {
        if isOver {
            resultString = String(Int(popMax(a: leftNumber, b: rightNumber))! + 1) + resultString
            isOver = false
            break
        }
        resultString = popMax(a: leftNumber, b: rightNumber) + resultString
        break
    }
    
    if minOfTwoNumberCount < 18 {
        leftPiece = bringPiece(from: &leftNumber, amount: minOfTwoNumberCount)
        rightPiece = bringPiece(from: &rightNumber, amount: minOfTwoNumberCount)
        if isOver {
            leftPiece = Substring(String(Int(leftPiece)! + 1))
            isOver = false
        }
    } else {
        leftPiece = bringPiece(from: &leftNumber, amount: 10)  // amount: 18
        rightPiece = bringPiece(from: &rightNumber, amount: 10) // amount: 18
        if isOver {
            leftPiece = Substring(String(Int(leftPiece)! + 1))
            isOver = false
        }
    }
 
    var sumPiece = sumPiece(a: &leftPiece, b: &rightPiece)
    
    if sumPiece.count > leftPiece.count {
        if leftNumber.count == 0 && rightNumber.count == 0 {
            resultString = sumPiece + resultString
            break
        } else {
            sumPiece.remove(at: sumPiece.startIndex)
            isOver = true
        }
    }
    
    resultString = sumPiece + resultString
}

print(resultString)

func bringPiece(from str: inout String, amount: Int) -> Substring {
    let needIdx = str.index(str.endIndex, offsetBy: -amount)
    let result = str[needIdx..<str.endIndex]
    str.removeSubrange(needIdx..<str.endIndex)
    return result
}

func popMax(a: String, b: String) -> String {
    let checkMax = max(a.count,b.count)
    if checkMax == a.count {
        return a
    } else {
        return b
    }
}

var zeroString = ""

func sumPiece(a: inout Substring, b: inout Substring) -> String {
    var sumPieceValue = ""
    cleanZero(ax: &a, bx: &b)
    sumPieceValue = zeroString + String(Int(a)! + Int(b)!)
    return sumPieceValue
}



func cleanZero(ax: inout Substring, bx: inout Substring) {
    while ax[ax.startIndex] == "0" && bx[bx.startIndex] == "0" {
        print("0 때문에 오류")
        ax.remove(at: ax.startIndex)
        bx.remove(at: bx.startIndex)
        zeroString += "0"
    }
}




