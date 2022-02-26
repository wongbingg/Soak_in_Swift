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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDesign()
        setUpEvents()
    }
    
    func setUpDesign() {
        
        calendarView.scope = .month// .month 로 바꿀 수 있다
        dateFormatter.dateFormat = "yyyy-MM-dd" // 날짜별 담기는 data의 string 양식
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0 // 양쪽의 흐릿한 헤더 없애기
        calendarView.appearance.headerDateFormat = "YYYY년 MM월" // headerDate가 3월 에서 4월로 넘어가는 시점을 찾아서 monthLabeL 에 업데이트 하고싶다!!
        calendarView.appearance.titleWeekendColor = .red //주말날짜의 색
    }
    
    func setUpEvents() {
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let xmas = dateFormatter.date(from:"2022-02-23")
        let sampledate = dateFormatter.date(from: "2022-02-15")
        events = [xmas!,sampledate!]
    }
    
//MARK: 캘린더의 날짜 클릭 시 Action
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        dateInfo = dateFormatter.string(from: date)
        print(dateInfo , "날짜가 선택 되었습니다.")
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

