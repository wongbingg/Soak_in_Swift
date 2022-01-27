//
//  ViewModel.swift
//  MVVMpatternPractice
//
//  Created by 이원빈 on 2022/01/27.
//

import Foundation

class PersonViewModel: ObservableObject {
    @Published var person: Person
    
    init() {
        self.person = Person(name: "Lee" , age: 27)
    }
    func addAge() {
        self.person.age += 1
    }
    func preAge() {
        self.person.age -= 2
    }
}
