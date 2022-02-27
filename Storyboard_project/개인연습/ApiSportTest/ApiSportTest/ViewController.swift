//
//  ViewController.swift
//  ApiSportTest
//
//  Created by 이원빈 on 2022/02/24.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var leaguenameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leaguelogoImage: UIImageView!
    
    @IBOutlet weak var homeLogoImage: UIImageView!
    @IBOutlet weak var homeTeam: UILabel!
    
    @IBOutlet weak var awayLogoImage: UIImageView!
    @IBOutlet weak var awayTeam: UILabel!
    
    
    
    var sportManager = SportManager()
    var lst:[Substring] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportManager.delegate = self
        sportManager.getData(season: "2021", teamid: "42")
        
    }
    
    
    @IBAction func loadDateButtonPressed(_ sender: UIButton) {
        
        print(lst)
    }
    
    
}

extension ViewController: SportManagerDelegate {
    
    
    func didUpdateSport(_ sportManager: SportManager, sport: SportModel) {
        let url = URL(string: sport.logoimagestring)
        let url1 = URL(string: sport.homeLogo)
        let url2 = URL(string: sport.awayLogo)
        let data = try? Data(contentsOf: url! )
        let data1 = try? Data(contentsOf: url1! )
        let data2 = try? Data(contentsOf: url2! )
        DispatchQueue.main.async {
            self.leaguenameLabel.text = sport.leagueName
            self.leaguelogoImage.image = UIImage(data: data!)
            
            self.homeLogoImage.image = UIImage(data: data1!)
            self.homeTeam.text = "\(sport.homeTeam)"
            
            self.awayLogoImage.image = UIImage(data: data2!)
            self.awayTeam.text = sport.awayTeam
            
            self.dateLabel.text = "Date: \(sport.date)"
            self.lst = sport.datelist
           
        }
        
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
