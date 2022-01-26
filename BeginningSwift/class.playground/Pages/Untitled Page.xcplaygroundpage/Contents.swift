

class Student {
    var name: String = "unknown"
    var classs: String = "Swift"
    
    class func selfIntroduce() {
        print("학생타입입니다")
    }
    func selfIntroduce() {
        print("저는 \(self.classs)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var wongbing: Student = Student()
wongbing.name = "wongbing"
wongbing.classs = "스위프트"
wongbing.selfIntroduce()

let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce()

