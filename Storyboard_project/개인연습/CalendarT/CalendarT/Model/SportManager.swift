//
//  SportManager.swift
//  CalendarT
//
//  Created by 이원빈 on 2022/02/27.
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
    
    func getData(season: String, teamid: String, date: String?) {
        var urlString:String = ""
        if date == nil {
            urlString = "\(sportURL)season=\(season)&team=\(teamid)"
        }else{
            urlString = "\(sportURL)season=\(season)&team=\(teamid)&date=" + date!
        }
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        var request = URLRequest(url: URL(string: urlString)! ,timeoutInterval: Double.infinity)
        request.addValue("910c37943cee9a4596b6186c6782bfb7", forHTTPHeaderField: "x-rapidapi-key")
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
            // calendar도트 추가 할 date 값만 빼오기
            let decodedData = try decoder.decode(SportData.self, from: sportData)
            
            var dateComponents = DateComponents() //?
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            var datelists:[Date]=[]
            for i in 0..<decodedData.response.count {
                if let datesubstring = subT(decodedData.response[i].fixture.date,0,10) {
                    if let dateDate = dateFormatter.date(from:String(datesubstring)) {
                        datelists.append(dateDate)
                    }else {
                        print("dateDate is nil")
                    }
                }else{
                    print("subT is nil!")
                }
            }

            let name = decodedData.response[0].league.name
            let date = subT(decodedData.response[0].fixture.date,0,10)
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
