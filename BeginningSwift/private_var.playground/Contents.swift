

struct ChatView {
    
    var message = ""
    
    var messageWithPrefix: String {
        let prefix = "Chris says: "
        return prefix + message
    }

    func sendChat() {

        print(messageWithPrefix)
    }
}

var chat:ChatView = ChatView()
chat.message = "hello! what r u doing?"
chat.sendChat()


struct DatabaseManager {
    
    private var serverName = "server1" // 이 struct 안에서만 사용가능
    
    func saveData(data:String) -> Bool {
        print(serverName)
        //this code saves the data and returns a boolean result
        return true
        
    }
}


struct ChatViewer {

    var message = "Hello"

    func sendChat(){
        //Save the chat message
        let db = DatabaseManager()

        let Successful = db.saveData(data: message)
        // Check the successful boolean value, if unsuccessful, show alert to usre
        
    }
}

var viewer = ChatViewer()

viewer.sendChat()
