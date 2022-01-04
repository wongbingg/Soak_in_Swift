 
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
emilio.medicalEmergency()
bin.medicalEmergency()
