// <10814> 나이순 정렬
// 나이와 이름이 가입한 순서대로 주어진다.
// 회원들을 나이가 증가하는 순으로, 나이가 같으면 먼저 가입한 사람이 앞에오는 순서로 정렬하는 프로그램 작성
// 회원수 N이 주어진다 (1<= N <= 100,000)

let N = Int(readLine()!)!
var peopleList: [[Any]] = []
(1...N).forEach { _ in
    var information = readLine()!.split(separator: " ").compactMap { String($0) }
    peopleList.append([Int(information[0])!, information[1]])
}



let sortedList = peopleList.sorted { a, b in
    if let aElement = a[0] as? Int ,let bElement = b[0] as? Int {
        return aElement < bElement
        if aElement == bElement {
            return peopleList.firstIndex(where: { $0  == aElement } )! < peopleList.firstIndex(where: { $0 == bElement } )!
        }
    }
}
// 나이순 정렬이 되고나서 같은 나이인 사람이 있다면, 먼저 등록한 순으로 정렬하는 미션

sortedList.forEach { print($0) }

func sortingList<T: Equatable>(list: T.Type) {
    guard let list = list as? T else { return }
    
}
