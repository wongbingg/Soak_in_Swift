//
//  File.swift
//  ApiSportTest
//
//  Created by 이원빈 on 2022/02/24.
//

import Foundation

struct SportData: Codable {
    let response:[Response]
}

struct Response: Codable {
    let league:League
}
struct League: Codable {
    let id: Int
    let name: String
}
