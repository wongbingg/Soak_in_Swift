//
//  File.swift
//  ApiSportTest
//
//  Created by 이원빈 on 2022/02/24.
//

import Foundation
import UIKit

struct SportData: Codable {
    let response:[Response]
}

struct Response: Codable {
    let fixture:Fixture
    let league:League
    
}
struct Fixture: Codable {
    let date: String
}
struct League: Codable {
    let id: Int
    let name: String
    let logo: String
}
