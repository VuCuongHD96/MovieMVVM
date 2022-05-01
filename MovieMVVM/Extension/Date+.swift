//
//  Date+.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import Foundation

extension Date {
    
    static func fromString(_ dateString: String) -> Date {
        let dateInputFormatter = DateFormatter()
        dateInputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateInput = dateInputFormatter.date(from: dateString) ?? Date()
        return dateInput
    }
    
    static func stringFrom(dateInput: Date) -> String {
        let dateOutputFormatter = DateFormatter()
        dateOutputFormatter.locale = Locale(identifier: "en")
        dateOutputFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let dateOutput = dateOutputFormatter.string(from: dateInput)
        return dateOutput
    }
}
