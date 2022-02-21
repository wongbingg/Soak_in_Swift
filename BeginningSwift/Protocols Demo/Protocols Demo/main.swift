protocol CanFly {
    func fly()
}
extension CanFly {
    func fly() {
        print("The object takes off into the air")
    }
}


class Bird {

    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
}

class Eagle: Bird, CanFly{

    func soar() {
        print("The eagle glides in the air using air currents")
    }
    
}

class Penguin: Bird {
    func swim(){
        print("The panguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly { //protocol can be addopted class, struct, not inheritance not limited
  
}



