//
//  Date.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 29/03/24.
//

import Foundation

extension Date {
    
    var onlyDate: Date? {
        get {
            let calender = Calendar.current
            var dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            dateComponents.timeZone = NSTimeZone.system
            return calender.date(from: dateComponents)
        }
    }
    
    var customFormatedDate: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .full
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self.onlyDate!)
    }
    
}


