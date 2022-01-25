import UIKit

class Car {
    var color = "Red"
    
    static let shared = Car()
}

let myCar = Car.shared
myCar.color = "Blue"

let yourCar = Car.shared
print(yourCar.color)

let myCar2 = Car.shared
print(myCar2.color)
myCar2.color = "purple"
print(myCar2.color)

class A {
    init(){
        Car.shared.color = "Brown"
    }
}

class B {
    init(){
        print(Car.shared.color)
    }
}

let a = A()
let b = B()

