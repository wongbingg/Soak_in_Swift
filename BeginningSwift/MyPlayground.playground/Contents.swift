//let greeting = "Hello, World!"
//let index = greeting.index(of: ",") ?? greeting.endIndex
//let beginning = greeting[..<index]
//
//let newString = String(beginning)

//문자열과 문자비교
//let quotation = "We're a lot alike, you and I."
//let sameQuotation = "We're a lot alike, you and I."
//if quotation == sameQuotation {
//    print("These two strings are considered equal")
//}

//접두사 접미사 비교
//let romeoAndJuliet = [
//    "Act 1 Scene 1: Verona, A public p;ace",
//    "Act 1 Scene 2: Capulet's mansion",
//    "Act 1 Scene 3: A room in Capulet's mansion",
//    "Act 1 Scene 4: A street outside Capulet's mansion",
//    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
//    "Act 2 Scene 1: Outside Capulet's mansion",
//    "Act 2 Scene 2: Capulet's orchard",
//    "Act 2 Scene 3: Outside Friar Lawrence's cell",
//    "Act 2 Scene 4: A street in Verona",
//    "Act 2 Scene 5: Capulet's mansion",
//    "Act 2 Scene 6: Friar Lawrence's cell"
//
//]
//
//var act1SceneCount = 0
//for scene in romeoAndJuliet {
//    if scene.hasPrefix("Act 1") {//접두어
//        act1SceneCount += 1
//    }
//}
//print("There are \(act1SceneCount) scenes in Act 1")
//
//var mansionCount = 0
//var cellCount = 0
//for scene in romeoAndJuliet {
//    if scene.hasSuffix("Capulet's mansion"){//접미어
//        mansionCount += 1
//    } else if scene.hasSuffix("Friar Lawrence's cell") {
//        cellCount += 1
//    }
//}
//print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
print("a","b",terminator: "\"")

