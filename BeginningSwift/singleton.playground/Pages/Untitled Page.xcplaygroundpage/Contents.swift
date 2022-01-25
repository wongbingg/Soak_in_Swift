import UIKit

class Car {
    var color = "Red"
}

let myCar = Car()
myCar.color = "Blue" //class는 참조값

let yourCar = Car()
print(myCar.color)
