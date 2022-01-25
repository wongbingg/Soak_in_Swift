import Foundation


var pizzaInches: Int = 10 {
    willSet {

    }
    didSet{
        if pizzaInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInches = 18
        }
    }
}

pizzaInches = 33

print(pizzaInches) // 33이 나올 것 같지만 18이 나온다





var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int{
    get{
        return pizzaInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set{
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 6

print(numberOfPeople)
