
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
//    init() {} // default initializer와 같다
//    init(origin: Point, size: Size) { // memberwise initializer와 같다
//        self.origin = origin
//        self.size = size
//    }
    
    
}

extension Rect {
    
    init(center: Point, size: Size) { // Initializer delegation(위임)
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//let basicRect = Rect()
//// x 0.0 y 0.0 width 0.0 height 0.0
//let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//// x 2.0 y 2.0 width 5.0 height 5.0
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
//// x 2.5 y 2.5 width 3.0 height 3.0

let text = Rect(center: <#T##Point#>, size: <#T##Size#>)
