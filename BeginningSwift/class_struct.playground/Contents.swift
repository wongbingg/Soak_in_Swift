import UIKit

//유튜버 (데이터) 모델 - struct / 구조체
struct YoutuberSrtuct {
    var name : String
    var subscribersCount : Int
}
var devJeong = YoutuberSrtuct(name: "정대리", subscribersCount: 99999)

//값복사
var devJeongClone = devJeong

print("값 넣기 전 devJeongClone.name : \(devJeongClone.name)")

devJeongClone.name = "호로로"

print("값 넣은 후 devJeongClone.name : \(devJeongClone.name)")
print("값 넣은 후 devJeong.name \(devJeong.name)")

// 클래스
class YoutuberClass {
    var name : String
    var subscribersCount : Int
    //생성자 - 즉 메모리에 올린다
    //init 으로 매개변수를 가진 생성자 메소드를 만들어야
    //먀갸변수를 넣어서 그값을 가진 객체(object)를 만들 수 있다.
    init(name: String, subscribersCount: Int){
        self.name = name
        self.subscribersCount = subscribersCount
    }
}
var jeongDaeRi = YoutuberClass(name:"정대리",subscribersCount: 9999)
var jeongDaeRiClone = jeongDaeRi


print("값 넣기 전 jeongDaeriClone.name : \(jeongDaeRiClone.name)")

jeongDaeRiClone.name = "호로롤롤로"

print("값 넣은 후 jeongDaeRiClone.name : \(jeongDaeRiClone.name)")
print("값 넣은 후 jeongDaeRi.name : \(jeongDaeRi.name)")

//struct 와 class 의 차이점
