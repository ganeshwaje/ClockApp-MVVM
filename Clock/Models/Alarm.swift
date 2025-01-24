//
//  Alarm.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import Foundation

class Alarm: ObservableObject, Identifiable {
  let id = UUID()
  @Published var time: Date
  @Published var label: String
  @Published var isEnabled: Bool
  @Published var repeatDays: Set<WeekDay>
  
  init(time: Date = Date(), label: String = "Alarm", isEnabled: Bool = true, repeatDays: Set<WeekDay> = []) {
    self.time = time
    self.label = label
    self.isEnabled = isEnabled
    self.repeatDays = repeatDays
  }
}
