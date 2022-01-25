import Foundation

var width: Float = 3.4
var height: Float = 2.1

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket:Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBucket = ceilf(numberOfBuckets)
        return Int(roundedBucket)
    }
    set {
        let canPaintArea = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(canPaintArea)")
    }
}

bucketsOfPaint = 8 //선언 타이밍에 set이 발동된다
