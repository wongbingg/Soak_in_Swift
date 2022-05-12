//<2231> 분해합
//M = 245 일때 N = 245 + 2 + 4 + 5 즉, N은 M의 분해합이다, M 은 N의 생성자가 된다.
// N이 주어졌을 때 가장 작은 M을 구하라

let N = Int(readLine()!)!

for i in 1...N {
    let firstItem = i
    var secondItem: Int {
        get{
            var result = 0
            String(i).forEach { result += Int(String($0))! }
            return result
        }
    }
    let calculatedNumber = firstItem + secondItem
    if calculatedNumber == N {
        print(i)
        break
    }
    if i == N {
        print(0)
    }
}

