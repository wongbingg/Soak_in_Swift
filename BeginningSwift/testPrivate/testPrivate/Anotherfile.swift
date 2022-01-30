//
//  Anotherfile.swift
//  testPrivate
//
//  Created by 이원빈 on 2022/01/30.
//

import Foundation

class AnotherClassInAnotherFile{
    
    let aClass = AClass()
    
    init() {
        
        //Step 8. Try to print aFilePrivateProperty Here - Impossible
//        print("\(aClass.aFilePrivateProperty) printed from AnotherAnother")
        
        //Step 10. Try to print anInternalProperty Here - Possible??
        print("\(aClass.anInternalProperty) printed from AnotherAnother")
        
    }
}
