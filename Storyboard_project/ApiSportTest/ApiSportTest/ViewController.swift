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
    var sportManager = SportManager()
    
    override func viewDidLoad() {
          super.viewDidLoad()
        sportManager.delegate = self
        sportManager.getData(teamid: "5")
      }
}

extension ViewController: SportManagerDelegate {
    func didUpdateSport(_ sportManager: SportManager, sport: SportModel) {
        DispatchQueue.main.async {
            self.citynameLabel.text = sport.cityName
            self.teamIdLabel.text = String(sport.teamId)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
