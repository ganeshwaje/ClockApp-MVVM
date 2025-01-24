//
//  WeekDay.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import Foundation

enum WeekDay: Int, CaseIterable {
  case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
  
  var shortName: String {
    switch self {
    case .sunday: return "Sun"
    case .monday: return "Mon"
    case .tuesday: return "Tue"
    case .wednesday: return "Wed"
    case .thursday: return "Thu"
    case .friday: return "Fri"
    case .saturday: return "Sat"
    }
  }
}
