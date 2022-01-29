
func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    switch loveScore {
    case 81...100:
        print("You love each other like Kanye loves Kanye.")
    case 41..<81:
        print("you go together like Coke and Mentos")
    case ...40:
        print("You'll be forever alone")
    default:
        print("Error lovescore is out of range.")
    }
}
loveCalculator()
