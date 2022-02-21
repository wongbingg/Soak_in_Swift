 
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport? //protocol 선언시점
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR() // delegate 를 가지고있는 사람에게 연락한다?
    }
}

struct Paramedic: AdvancedLifeSupport { //protocol 선언시점
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions")
    }
}
class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compression.")
    }
    func useStethoscope(){
        print("listening for heart")
        
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}

let bin = EmergencyCallHandler()
let emilio = EmergencyCallHandler()
let angela = Paramedic(handler:emilio)
let wong = Doctor(handler: bin)

emilio.assessSituation()
emilio.medicalEmergency() //angela do?
bin.medicalEmergency() //wong do?

//EmergencyCallHandler 클래스를 가지는 상수가 medicalEmergency 함수를 호출하면, 그 상수와 delegate로 연결된 다른 클래스의 하지만,같은 protocol을 채택하는 상수에서
//대신 실행해준다
