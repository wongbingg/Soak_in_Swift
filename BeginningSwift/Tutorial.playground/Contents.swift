//struct ChatView {
//
//    //Properties
//    var message = ""
//    var messageWithPrefix:String {
//        let prefix = "Chris says: "
//        return prefix + message
//    }
//
//    //View Code for this screen
//
//    //methods
//    func sendChat() {
//
//
//        //Codoe to snd the chat message
//        print(messageWithPrefix)
//    }
//
//    func deleteChat() {
//
//        print(messageWithPrefix)
//    }
//
//}


//struct MyStructure {
//
//    var message = "Hello"
//
//    func myFunction() {
//
//        print("message")
//
//    }
//}
//
//var a:MyStructure = MyStructure()
//a.message = "Hi"
//a.myFunction() // 강의영상에선 Hi를 출력했는데 버전차이인지 message를 그냥 출력한다. Struct안의 var값 변경 불가?
//
//var b = MyStructure()
//b.message = "World"
//print(b.message)

struct DatabaseManager {
    
    private var serverName = "Server 1" // 이 struct 안에서만 사용가능
    
    func saveData(data:String) -> Bool {
        print(serverName)
        //this code saves the data and returns a boolean result
        return true
        
    }
}


struct ChatView {
    
    var message = "Hello"
    
    func sendChat(){
        //Save the chat message
        var db = DatabaseManager()
        
        let Successful = db.saveData(data: message)
        // Check the successful boolean value, if unsuccessful, show alert to usre
    }
}
