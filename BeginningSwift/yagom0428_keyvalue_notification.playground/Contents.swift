import Foundation

let center: NotificationCenter = NotificationCenter.default

// 1. 구독자 등록 -> 노티피케이션 센터에 등록 (
// 2. 스트리머 방송 -> 노티피케이션 센터에게 방송 때려줘
// 3. 노티피케이션 센터 - 구독자들에게 방송 전달

// key-value observing : object - C 상속받는다 .
class User: NSObject {
    let id: String
    var statusMessage: String
    lazy var notificationName = NSNotification.Name(id)
    private var following: [User] = []
    private var follower: [User] = []
    var privateLover: User? {
        didSet {
            guard let privateLover = privateLover else {
                return
            }
            observe(\.privateLover?.statusMessage) {
                object, change in
                print("\(change.oldValue) : \(change.newValue)")
            }
        }
    }
    
    func broadcastLive() {
        center.post(name: notificationName,
                    object: self,
                    userInfo: [:])
    }
    
    func addFollwer(_ user: User...) {
        follower.append(contentsOf: user)
    }
    
    func follow(_ user: User) {
        user.addFollwer(self)
        center.addObserver(forName: notificationName,
                           object: user,
                           queue: nil) { notification in
            print(user.id + "이가 방송을 하느중 ..")
        }
    }
    
    init(id: String, statusMessage: String = "") {
        self.id = id
        self.statusMessage = statusMessage
    }
}

var minsson = User.init(id: "쏘니", statusMessage: "메세지")
var zzbae = User(id: "지지배", statusMessage: "떡볶이 왕")
var derrick = User(id: "데릭", statusMessage: "횐님 식단관리 하세요")
var hugh = User(id: "휴", statusMessage: "휴~~")

minsson.follow(hugh)
derrick.follow(hugh)
hugh.broadcastLive()

zzbae.privateLover = minsson

minsson.statusMessage = "sdfsdfasdf"
