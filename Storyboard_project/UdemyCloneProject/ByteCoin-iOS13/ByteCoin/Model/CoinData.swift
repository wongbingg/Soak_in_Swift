//
//  File.swift
//  ByteCoin
//
//  Created by 이원빈 on 2022/01/05.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable {  // CoinManager > parseJSON 에서 사용하기 위해 만듦
    let rate: Double
}
