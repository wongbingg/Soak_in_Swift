//
//  ViewController.swift
//  AlamofireT
//
//  Created by 이원빈 on 2022/02/14.
//

import UIKit
import Alamofire



class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    func getData() {
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=82dc71828b844e5d194f3128d649c0e8&units=metric&q=London"
        AF.request(url).responseJSON { response in
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(WeatherData.self, from: response.data!) //WeatherData 부분에 해당 링크의 데이터모델 투입
                self.textLabel.text = decodedData.name // 값만 빼오기
                
            } catch {
                print("default error catch") // 그냥 임의로 넣어준 값
            }
            
        }
    }
}


    
    



//"https://jsonplaceholder.typicode.com/todos/1"
/*   {
         "userId": 1,
         "id": 1,
         "title": "delectus aut autem",
         "completed": false
     }                                         */

 
//"https://api.openweathermap.org/data/2.5/weather?appid=82dc71828b844e5d194f3128d649c0e8&units=metric&q=London"
