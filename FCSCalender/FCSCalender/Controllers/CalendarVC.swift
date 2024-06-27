//
//  CalendarVC.swift
//  FCSCalender
//
//  Created by LEADS Corporation Limited on 27/6/24.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController, FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance {

    @IBOutlet weak var calender_top_image: UIImageView!
    @IBOutlet weak var calenderDayMonthView: UIView!
    
    var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendar()
    }
    
    func setupCalendar() {
        calendar = FSCalendar()
        calendar.dataSource = self
        calendar.delegate = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calenderDayMonthView.addSubview(calendar)
        
        
        // Add constraints to make the calendar fit within calenderDayMonthView
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: calenderDayMonthView.topAnchor),
            calendar.bottomAnchor.constraint(equalTo: calenderDayMonthView.bottomAnchor),
            calendar.leadingAnchor.constraint(equalTo: calenderDayMonthView.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: calenderDayMonthView.trailingAnchor)
        ])
    }
    
    // MARK: - FSCalendarDataSource
     
//     func minimumDate(for calendar: FSCalendar) -> Date {
//         return Date() // Set the minimum date for the calendar
//     }
     
    // MARK: - FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = TimeZone.current
        let selectedDateString = dateFormatter.string(from: date)
        
        print("Selected date: \(selectedDateString)")
    }
    
    
    // MARK: - FSCalendarDelegateAppearance
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday, .year, .month], from: date)
        
        if components.year == 2022 && components.month == 11 {
            return UIColor.red // Change this to the desired color for November 2022
        }
        
        if components.weekday == 6 || components.weekday == 7 { // 6: Friday, 7: Saturday
            return UIColor.gray
        }
        
        return nil // Default color for other dates
    }

}
