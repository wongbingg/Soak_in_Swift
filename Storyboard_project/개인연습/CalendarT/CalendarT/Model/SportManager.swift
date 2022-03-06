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
    
    func getData(season: String, teamid: String) {
        let urlString = "\(sportURL)season=\(season)&team=\(teamid)"
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
            
            var leagueNameList:[String] = []
            var logoimagestringList:[String] = []
            var homeLogoList:[String] = []
            var homeTeamList:[String] = []
            var awayLogoList:[String] = []
            var awayTeamList:[String] = []
            
            var dateList:[Date]=[]
            
            
            for i in 0..<decodedData.response.count {
                
                if let datesubstring = subT(decodedData.response[i].fixture.date,0,10) {
                    if let dateDate = dateFormatter.date(from:String(datesubstring)) {
                        dateList.append(dateDate)
                    }else {
                        print("dateDate is nil")
                    }
                }else{
                    print("subT is nil!")
                }
                
                leagueNameList.append(decodedData.response[i].league.name)
                logoimagestringList.append(decodedData.response[i].league.logo)
                homeLogoList.append(decodedData.response[i].teams.home.logo)
                homeTeamList.append(decodedData.response[i].teams.home.name)
                awayLogoList.append(decodedData.response[i].teams.away.logo)
                awayTeamList.append(decodedData.response[i].teams.away.name)
            }

            let sport = SportModel(leagueName: leagueNameList, logoimagestring: logoimagestringList, homeLogo: homeLogoList, homeTeam: homeTeamList, awayLogo: awayLogoList, awayTeam: awayTeamList, datelist: dateList)
            return sport
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    //문자열 슬라이싱
    func subT(_ text: String ,_ num1:Int, _ num2:Int) -> Substring? {
        
        let sub = text[text.index(text.startIndex, offsetBy: num1)..<text.index(text.startIndex,offsetBy: num2)]
        return sub
    }
}
