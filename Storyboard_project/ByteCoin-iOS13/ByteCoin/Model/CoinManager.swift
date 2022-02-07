//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D2E3121B-2F88-4B3A-BB74-91419E489B3C"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func getCoinPrice(for currency: String){ //delegate.didUpdatePrice, delegate.didFailWithError 사용
        
        let urlString = String("\(baseURL)/\(currency)?apikey=\(apiKey)")
        
        //optional binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString) {
            
            //Creat a new URLSession object with default configuration.
            let session = URLSession(configuration: .default)
            
            //Creat a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error )in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                //Format the data we got back as a string to be able to print it.
                if let safeData = data{
                    if let bitcoinPrice = self.parseJSON(safeData){
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }// getCoinPrice 함수에서 얻은 값 price 와 currency 는 ViewController에 coinManagerDelegate프로토콜을 사용한
                    // extension ViewController: CoinManagerDelegate {} 안에서 값을 부여
                }
                
            }
            task.resume()
        }
        
    }
    
    
    func parseJSON(_ data: Data) -> Double? { //웹API에서 필요한 정보만 쏙 빼오는 작업 delegate.didFailWithError 사용
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            
            let lastPrice = decodedData.rate
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}


