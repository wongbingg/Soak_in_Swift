import Foundation

var semaphore = DispatchSemaphore (value: 0)

var request = URLRequest(url: URL(string: "https://v3.football.api-sports.io/leagues?id=4")!,timeoutInterval: Double.infinity)

request.addValue("972d0d7eb6d835b0ef61735398166744", forHTTPHeaderField: "x-rapidapi-key")
request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")

request.httpMethod = "GET"


let task = URLSession.shared.dataTask(with: request) { data, response, error in
  guard let safeData = data else {
    print(String(describing: error))
    semaphore.signal()
    return
  }
  print(String(data: safeData, encoding: .utf8)!)
  semaphore.signal()
}

task.resume()
semaphore.wait()

