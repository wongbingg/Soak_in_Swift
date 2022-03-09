import UIKit
import Foundation

let date = Date(timeIntervalSince1970: 1630150200)
print("현지시간 :",date)

var calendar = Calendar.current
let year = calendar.component(.year, from: date)
let month = calendar.component(.month, from: date)
let day = calendar.component(.day, from: date)
let hour = calendar.component(.hour, from: date)
let minute = calendar.component(.minute, from: date)

print("우리나라 시간 : \(year)년 \(month)월 \(day)일 \(hour):\(minute)")
