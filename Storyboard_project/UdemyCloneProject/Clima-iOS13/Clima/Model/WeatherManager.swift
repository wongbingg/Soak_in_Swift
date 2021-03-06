//
//  WeatherManager.swift
//  Clima
//
//  Created by 이원빈 on 2022/01/01.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=82dc71828b844e5d194f3128d649c0e8&units=metric"
    
    var delegate: WeatherManagerDelegate? 
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString){ // url 값이 존재한다면
            
            let session = URLSession(configuration: .default) //?
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil { // 에러가 존재하면!
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data { // data값이 존재하면,
                   if let weather = self.parseJSON(safeData){ //data값을 parse 한 값이 존재하면,
                       self.delegate?.didUpdateWeather(self, weather: weather)
                }
            }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data)-> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //여기서 weatherData 가 json 파일에 해당
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name //json파일에서 추출하기
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp) //WeatherModel에 parse한 값을 넣어준다 --> struct WeatherModel 에서는 그 값을 가공해준다
            return weather
         
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
