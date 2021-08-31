//
//  Date+.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import Foundation

extension Date {
    
    static func fromString(_ data: String) -> Date {
        let dateInputFormat = DateFormatter()
        dateInputFormat.dateFormat = "YYYY-MM-dd"
        let dateInput = dateInputFormat.date(from: data) ?? Date()
        return dateInput
    }
    
    static  func stringFrom(date: Date) -> String {
        let dateOutputFormat = DateFormatter()
        dateOutputFormat.dateFormat = "EEEE - dd - MM - YYYY"
        let dateString = dateOutputFormat.string(from: date)
        return dateString
    }
}
