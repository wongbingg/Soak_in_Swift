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
            
            var leagueNameList:[String] = []
            var logoimagestringList:[String] = []
            var homeLogoList:[String] = []
            var homeTeamList:[String] = []
            var awayLogoList:[String] = []
            var awayTeamList:[String] = []
            var timestampList:[String] = []
            var dateList:[String] = []
            let eventDate = DateFormatter()
            eventDate.dateFormat = "yyyy-MM-dd"  //ViewController 도트표시에 들어갈 정보
            let dateDetail = DateFormatter()
            dateDetail.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분" //NextVC에 들어갈 정보
            
            
            for i in 0..<decodedData.response.count {

                let date = Date(timeIntervalSince1970: TimeInterval(decodedData.response[i].fixture.timestamp))
                dateList.append(eventDate.string(from: date))  //도트표시에 이용할 데이트 타입
                timestampList.append(dateDetail.string(from: date)) //NextVC에 사용할 HH:mm 타입
                leagueNameList.append(decodedData.response[i].league.name)
                logoimagestringList.append(decodedData.response[i].league.logo)
                homeLogoList.append(decodedData.response[i].teams.home.logo)
                homeTeamList.append(decodedData.response[i].teams.home.name)
                awayLogoList.append(decodedData.response[i].teams.away.logo)
                awayTeamList.append(decodedData.response[i].teams.away.name)
            }

            let sport = SportModel(leagueName: leagueNameList, logoimagestring: logoimagestringList, homeLogo: homeLogoList, homeTeam: homeTeamList, awayLogo: awayLogoList, awayTeam: awayTeamList, datelist: dateList ,timestamplist: timestampList)
            return sport
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
