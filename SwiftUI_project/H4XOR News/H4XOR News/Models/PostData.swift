//
//  PostData.swift
//  H4XOR News
//
//  Created by 이원빈 on 2022/01/15.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
