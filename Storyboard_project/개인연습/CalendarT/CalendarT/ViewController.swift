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
    
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    let dateFormatter = DateFormatter()
    var dateInfo:String?
    var events = [Date]()
    var apiSportDatelist = ["2021-08-13", "2021-08-22", "2021-08-28", "2021-09-11", "2021-09-18", "2021-09-26", "2021-10-02", "2021-10-18", "2021-10-22", "2021-10-30", "2021-11-07", "2021-11-20", "2021-11-27", "2021-12-02", "2021-12-06", "2021-12-11", "2021-12-15", "2021-12-18", "2021-12-26", "2022-02-24", "2022-01-01", "2022-01-16", "2022-01-23", "2022-02-10", "2022-02-12", "2022-02-19", "2022-03-16", "2022-03-06", "2022-03-13", "2022-03-19", "2022-04-04", "2022-04-09", "2022-04-16", "2022-04-23", "2022-04-30", "2022-05-07", "2022-05-15", "2022-05-22", "2021-07-17", "2021-07-13", "2021-08-01", "2021-08-08", "2021-07-25", "2021-07-24", "2021-07-28", "2021-08-25", "2021-09-22", "2021-10-26", "2021-12-21", "2022-01-09", "2022-01-20", "2022-01-13"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDesign()
        setUpEvents()
    }
    
    func setUpDesign() {
        
        calendarView.scope = .month
        dateFormatter.dateFormat = "yyyy-MM-dd" // 날짜별 담기는 data의 string 양식
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0 // 양쪽의 흐릿한 헤더 없애기
        calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        calendarView.appearance.titleWeekendColor = .red
    }
    
    func setUpEvents() {
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        for i in apiSportDatelist {
            let resultdate = dateFormatter.date(from:i)
            events.append(resultdate!)
        }
        
    }
    
//MARK: 캘린더의 날짜 클릭 시 Action
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        dateInfo = dateFormatter.string(from: date)
        print(dateInfo! , "날짜가 선택 되었습니다.")
        if events.contains(date) {
            self.performSegue(withIdentifier: "gotoNext", sender: self)
        }
    }
    
//    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print(dateFormatter.string(from: date), "날짜가 해제 되었습니다.")
//    }
    
//MARK: 캘린더의 event도트 표시
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.events.contains(date) {
            return 1
        } else {
            return 0
        }
    }
    
    @IBAction func moveToNext(_ sender: UIButton) {
        self.moveCurrentPage(moveUp: true)
        
    }
    
    @IBAction func moveToPrev(_ sender: UIButton) {
        
        self.moveCurrentPage(moveUp: false)
    }
    
    private func moveCurrentPage(moveUp: Bool) {
        dateComponents.month = moveUp ? 1 : -1
        calendarView.currentPage = calendar.date(byAdding: dateComponents, to: calendarView.currentPage)!
        self.calendarView.setCurrentPage(calendarView.currentPage, animated: true)
    }

    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoNext" {
            let destinationVC = segue.destination as! NextVC
            destinationVC.currentDate = dateInfo
        }
        
    }
    
}

