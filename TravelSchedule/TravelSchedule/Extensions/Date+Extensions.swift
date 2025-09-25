//
//  Date+Extensions.swift
//  TravelSchedule
//
//  Created by Вадим Суханов on 08.09.2025.
//

import Foundation

extension Date {
    static let carriersListItemDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }()
    
    static let hoursAndMinutesFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var carriersListItemDateString: String {
        return Date.carriersListItemDateFormatter.string(from: self)
    }
    
    var hoursAndMinutesString: String {
        return Date.hoursAndMinutesFormatter.string(from: self)
    }
}
