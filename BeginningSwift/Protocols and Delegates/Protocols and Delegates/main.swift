//
//  Experiment.swift
//  Protocols and Delegates
//
//  Created by 이원빈 on 2022/02/20.
//

protocol Manager {
    func teaching()
}

class Boss {
    var delegate: Manager?
    func justWorking() {
        print("yee ~ im go~")
    }
    func callManager() {
        delegate?.teaching()
    }
}

struct Parttimejob: Manager {
    init(controller: Boss){
        controller.delegate = self
    }
    
    func teaching() {
            print("Do better boy!")
        }
}



let yellowMonkey = Boss()
let bigGirl = Parttimejob(controller: yellowMonkey)

yellowMonkey.justWorking()
yellowMonkey.callManager()



