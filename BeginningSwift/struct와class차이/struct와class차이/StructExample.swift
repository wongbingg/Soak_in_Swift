//
//  StructExample.swift
//  struct와class차이
//
//  Created by 이원빈 on 2022/01/31.
//

import Foundation

struct StructHero {
    
    var name: String
    var universe: String
    
    mutating func reverseName(){
        self.name = String(self.name.reversed())
        //Hulk kluH
    }
    
}


