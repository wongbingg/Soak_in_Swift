
//<1065> 한수

var input = Int(readLine()!)!
var n = 0

for i in 1...input {
    if i < 10 {
        n += 1
    }else if i < 100 {
        n += 1
    }else if i < 1000 {
        let rightplace = i % 10
        let middleplace = (i / 10) % 10
        let leftplace = i / 100
        if (rightplace - middleplace) == (middleplace - leftplace) {
            n += 1
        }
    }

}
print(n)
