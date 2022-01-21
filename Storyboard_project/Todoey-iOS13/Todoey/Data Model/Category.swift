//
//  Category.swift
//  Todoey
//
//  Created by 이원빈 on 2022/01/20.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()        // let array : Array<Int>() creat empty array of integer
}
