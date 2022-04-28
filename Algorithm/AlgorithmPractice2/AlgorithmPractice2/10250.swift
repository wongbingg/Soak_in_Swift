//<10250> ACM 호텔
//H층에 층당 W개의 방이 있는 HxW 호텔에 N번째 손님은 몇호실로 가야할까?
//호실의 순서를 배열로 저장해서 index값 N을 이용해 호실을 알아낸다
// N을 H 로 나눈 몫의 올림이 XX이고, 그 나머지가 YY에 해당 만약 나머지 0이면 H값으로 전환

let T = readLine().map{Int($0)!} ?? 0

var resultList: [String] = []
for _ in 1...T {
    let input = readLine()?.split(separator: " ").map{Int($0)!} ?? [0]
    let H = input[0]
    let N = input[2]
    
    var XX = N / H
    var YY = N % H
    
    if YY != 0 {
        XX += 1
    } else {
        YY = H
    }
    var XXstring = String(XX)
    let YYstring = String(YY)
    
    if XXstring.count == 1 {
        XXstring = "0" + XXstring
    }
    resultList.append(YYstring + XXstring)
}
for i in resultList {
    print(i)
}
