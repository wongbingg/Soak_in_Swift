//
//  Data.swift
//  ApiSportTest
//
//  Created by 이원빈 on 2022/02/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
import UIKit
#endif

protocol SportManagerDelegate {
    func didUpdateSport(_ sportManager: SportManager, sport: SportModel)
    func didFailWithError(error: Error)
}

struct SportManager {
    var semaphore = DispatchSemaphore (value: 0)
    let sportURL = "https://v3.football.api-sports.io/fixtures?"
    
    var delegate: SportManagerDelegate?
    
    func getData(season: String, teamid: String) {
        
        let urlString = "\(sportURL)season=\(season)&team=\(teamid)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        var request = URLRequest(url: URL(string: urlString)! ,timeoutInterval: Double.infinity)
        request.addValue("972d0d7eb6d835b0ef61735398166744", forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("v3.football.api-sports.io", forHTTPHeaderField: "x-rapidapi-host")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            if let sport = self.parseJSON(safeData){
                self.delegate?.didUpdateSport(self, sport: sport)
            }
            //print(String(data: safeData, encoding: .utf8))
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
    
    func parseJSON(_ sportData: Data) -> SportModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(SportData.self, from: sportData)
            
            let name = decodedData.response[0].league.name
            let date = subT(decodedData.response[0].fixture.date,0,10)
            
            var datelists:[Substring]=[]
            for i in 0..<decodedData.response.count {
                datelists.append(subT(decodedData.response[i].fixture.date,0,10)!)
            }
            
            let image = decodedData.response[0].league.logo
            let homeL = decodedData.response[0].teams.home.logo
            let homeT = decodedData.response[0].teams.home.name
            let awayL = decodedData.response[0].teams.away.logo
            let awayT = decodedData.response[0].teams.away.name
            
            let sport = SportModel(leagueName: name, date: date!,logoimagestring: image, homeLogo: homeL, homeTeam: homeT, awayLogo: awayL, awayTeam: awayT, datelist: datelists)
            return sport
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func subT(_ text: String ,_ num1:Int, _ num2:Int) -> Substring? {
        
        let sub = text[text.index(text.startIndex, offsetBy: num1)..<text.index(text.startIndex,offsetBy: num2)]
        return sub
    }
}








//playground 에서 정상 실행 되던 코드를 project 에서도 실행 가능하게 하려면 func 안에 넣어줘야 하나..?

