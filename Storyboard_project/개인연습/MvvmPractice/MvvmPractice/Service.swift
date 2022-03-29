//
//  Logic.swift
//  MvvmPractice
//
//  Created by 이원빈 on 2022/03/23.
//

import Foundation

class Service {
    
    let repository = Repository()
    
    var currentModel = Model(currentDateTime: Date())
    
    func fetchNow(onCompleted: @escaping (Model) -> Void) {
        repository.fetchNow { entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: entity.currentDateTime) else {return} //entity에서 currentDateTime 값만 뽑아온다
            
            let model = Model(currentDateTime: now)
            self.currentModel = model
            
            onCompleted(model)
        }
    }
    
    func moveDay(day: Int){
        guard let movedDay = Calendar.current.date(byAdding: .day,value: day, to: currentModel.currentDateTime) else {return}
        
        currentModel.currentDateTime = movedDay
    }
}
