import Foundation

protocol Shape {
    func draw() -> String
}
//MARK: - Triangle

struct Triangle: Shape {
    var size: Int
    
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
//print(smallTriangle.draw())

//MARK: - FlippedShape

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
//        if shape is Square {
//            return shape.draw()
//        }
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
//print(flippedTriangle.draw())



//MARK: - JoinedShape

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//print(joinedTriangles.draw())


//MARK: - Square

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

struct Sss: Shape {
    func draw() -> String {
        return "sisi"
    }
    
    func aa() {
        print("ㄹㄹㄹㄹ")
    }
}

//MARK: - Trapezoid <사다리꼴>

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    let sss = Sss()
    return sss
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())

func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape { // 프로토콜 타입을 반환한다.
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
//print(opaqueJoinedTriangles.draw())

func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//    if shape is Square {
//        return shape // Error: return types don't match
//    }
    return FlippedShape(shape: shape) //Error: return types don't match
}

func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    return Array<T>(repeating: shape, count: count)
}


