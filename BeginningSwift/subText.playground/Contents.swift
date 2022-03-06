
import Foundation

var text = "one"
var dd = text + "two"


let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let date = subT("2020-04-01t112",0,10)
let stringdate = String(date!)
let dateDate = dateFormatter.date(from:stringdate)





func subT(_ text: String ,_ num1:Int, _ num2:Int) -> Substring? {
    
    let sub = text[text.index(text.startIndex, offsetBy: num1)..<text.index(text.startIndex,offsetBy: num2)]
    return sub
}

subT("The Swift Language", 0, 9)
