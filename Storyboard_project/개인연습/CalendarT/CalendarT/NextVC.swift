//
//  NextVC.swift
//  CalendarT
//
//  Created by 이원빈 on 2022/02/22.
//

import UIKit
import Kingfisher

class NextVC: UIViewController {
    
    @IBOutlet weak var leaguenameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leaguelogoImage: UIImageView!
    
    @IBOutlet weak var homeLogoImage: UIImageView!
    @IBOutlet weak var homeTeam: UILabel!
    
    @IBOutlet weak var awayLogoImage: UIImageView!
    @IBOutlet weak var awayTeam: UILabel!
    
    
    // viewcontroller 에서 받아온  값
    
    var currentDate: String?
    var currentTeamId: String?
    
    var events = [Date]()
    var leagueName = [String]()
    var logoimagestring = [String]()
    var homeLogo = [String]()
    var hometeam = [String]()
    var awayLogo = [String]()
    var awayteam = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateDateType = dateFormatter.date(from: currentDate!)
        let idx = (events.firstIndex(of: currentDateDateType!))! // currentDate가 datelist안에서 해당하는 index값을 구한다
        // 그 index 값을 기준으로 데이터를 뽑아낸다
        
        let url = URL(string: logoimagestring[idx])
        let url1 = URL(string: homeLogo[idx])
        let url2 = URL(string: awayLogo[idx])
        
        DispatchQueue.main.async {
            
            self.leaguelogoImage.kf.setImage(with:url)
            self.leaguenameLabel.text = self.leagueName[idx]
            self.homeLogoImage.kf.setImage(with:url1)
            self.homeTeam.text = "\(self.hometeam[idx])"
            self.awayLogoImage.kf.setImage(with:url2)
            self.awayTeam.text = self.awayteam[idx]
            self.dateLabel.text = "Date: \(self.events[idx])"
            
        }
        
    }
    
    
    
    
    
    
    
    
}
