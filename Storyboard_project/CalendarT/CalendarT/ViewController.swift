//
//  ViewController.swift
//  CalendarT
//
//  Created by 이원빈 on 2022/02/22.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var monthLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    var dateInfo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.scope = .week
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        calendarView.appearance.headerDateFormat = nil//"YYYY년 MM월". headerDate가 3월 에서 4월로 넘어가는 시점을 찾아서 monthLabeL 에 업데이트 하고싶다!!
        calendarView.appearance.titleWeekendColor = .red
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        dateInfo = dateFormatter.string(from: date)
        print(dateInfo , "날짜가 선택 되었습니다.")
       
        self.performSegue(withIdentifier: "gotoNext", sender: self)
    }
//    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print(dateFormatter.string(from: date), "날짜가 해제 되었습니다.")
//    }

    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoNext" {
            let destinationVC = segue.destination as! NextVC
            destinationVC.mymy = dateInfo
        }
        
    }

}

