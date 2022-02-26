//
//  ViewController.swift
//  ApiSportTest
//
//  Created by 이원빈 on 2022/02/24.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var citynameLabel: UILabel!
    @IBOutlet weak var teamIdLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    
    var sportManager = SportManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportManager.delegate = self
        sportManager.getData(season: "2021", teamid: "42")
    }
    
    
}

extension ViewController: SportManagerDelegate {
    
    
    func didUpdateSport(_ sportManager: SportManager, sport: SportModel) {
        let url = URL(string: sport.logoimagestring)
        let data = try? Data(contentsOf: url! )
        DispatchQueue.main.async {
            self.citynameLabel.text = sport.cityName
            self.teamIdLabel.text = String(sport.teamId)
            self.dateLabel.text = "Date: \(sport.date)"
            
            self.logoImage.image = UIImage(data: data!)
        }
        
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
